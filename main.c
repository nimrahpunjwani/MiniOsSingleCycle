#include <stdint.h>
// minimal strcmp to avoid needing libc headers in freestanding build
static int streq4(const char *s, char a, char b, char c, char d) {
    return s[0] == a && s[1] == b && s[2] == c && s[3] == d && s[4] == '\0';
}

static int streq5(const char *s, char a, char b, char c, char d, char e) {
    return s[0] == a && s[1] == b && s[2] == c && s[3] == d && s[4] == e && s[5] == '\0';
}

static int streq3(const char *s, char a, char b, char c) {
    return s[0] == a && s[1] == b && s[2] == c && s[3] == '\0';
}

/* Match Chisel DataMem / Logisim MMIO (see README) */
#define UART_TX 0x10000000u
#define UART_RX 0x10000004u

static unsigned int uart_read(void) {
    volatile unsigned int *uart_rx = (volatile unsigned int *)UART_RX;
    return *uart_rx;
}

static inline void uart_write_char(unsigned char c) {
    volatile unsigned int *uart_tx = (volatile unsigned int *)UART_TX;
    *uart_tx = (unsigned int)c;
}

static inline long sys_write(long fd, const void *buf, long len) {
    (void)fd;
    const unsigned char *p = (const unsigned char *)buf;
    long written = 0;
    while (written < len) {
        uart_write_char(p[written]);
        written++;
    }
    return written;
}

static inline void sys_exit(int code) {
    (void)code;
    for (;;) { asm volatile("wfi"); }
}

// Simple CLI + Space Invaders demo integrated
#define W 24
#define H 12

static void draw_screen(char *buf) {
    sys_write(1, buf, (W + 1) * H);
}

static void clear_screen(char *buf) {
    for (int y = 0; y < H; y++) {
        for (int x = 0; x < W; x++) buf[y*(W+1)+x] = ' ';
        buf[y*(W+1)+W] = '\n';
    }
}

static void busy_delay(volatile int ticks) {
    while (ticks--) {
        for (volatile int i = 0; i < 20000; i++) {
            asm volatile ("nop");
        }
    }
}

void run_game(void) {
    static char screen[(W+1)*H];
    clear_screen(screen);

    int inv_y = 2;
    int inv_rows = 3;
    int inv_cols = 8;
    int inv_x = 2;
    int dir = 1;
    int player_x = W/2;

    for (int frame = 0; frame < 0x3fffffff; frame++) {
        clear_screen(screen);
        for (int x = 0; x < W; x++) screen[0*(W+1)+x] = '-';
        for (int x = 0; x < W; x++) screen[(H-1)*(W+1)+x] = '-';

        for (int r = 0; r < inv_rows; r++) {
            for (int c = 0; c < inv_cols; c++) {
                int x = inv_x + c*2;
                int y = inv_y + r;
                if (x >= 0 && x < W) screen[y*(W+1)+x] = 'W';
            }
        }
        screen[(H-2)*(W+1)+player_x] = '^';

        int shot_x = player_x;
        int shot_y = (H-3) - (frame/8)% (H-4);
        if (shot_y >= 1) screen[shot_y*(W+1)+shot_x] = '|';

        draw_screen(screen);

        if ((frame & 7) == 0) {
            inv_x += dir;
            if (inv_x + inv_cols*2 >= W-1 || inv_x <= 0) {
                dir = -dir;
                inv_y++;
            }
        }

        unsigned int in = uart_read();
        unsigned char c = in & 0xff;
        if (c == 'a' || c == 'A') {
            if (player_x > 0) player_x--;
        } else if (c == 'd' || c == 'D') {
            if (player_x < W-1) player_x++;
        } else if (c == 'q' || c == 'Q') {
            const char *bye = "\nExiting game.\n";
            sys_write(1, bye, 16);
            return;
        }

        busy_delay(1);
    }
}

int main(void) {
    char line[64];
    int li = 0;
    const char *prompt = "> ";

    sys_write(1, "MiniOS CLI. Type 'help' for commands.\n", 36);
    for (;;) {
        sys_write(1, prompt, 2);
        li = 0;
        for (;;) {
            unsigned int in = uart_read();
            unsigned char c = in & 0xff;
            if (c != 0) {
                sys_write(1, (const void *)&c, 1);
                if (c == '\r' || c == '\n') {
                    sys_write(1, "\n", 1);
                    line[li] = '\0';
                    break;
                } else if (c == 8 || c == 127) {
                    if (li > 0) li--;
                } else if (li < (int)sizeof(line)-1) {
                    line[li++] = c;
                }
                for (volatile int d=0; d<50; d++) asm volatile("nop");
            }
        }

        if (li == 0) continue;
        if (streq4(line, 'h', 'e', 'l', 'p')) {
            const char *h = "Commands: help, run, clear, exit\n";
            sys_write(1, h, 28);
        } else if (streq5(line, 'c', 'l', 'e', 'a', 'r')) {
            const char *crt = "\n\n\n\n\n\n\n\n\n\n";
            sys_write(1, crt, 40);
        } else if (streq3(line, 'r', 'u', 'n')) {
            run_game();
        } else if (streq4(line, 'e', 'x', 'i', 't')) {
            sys_exit(0);
        } else {
            const char *unk = "Unknown command\n";
            sys_write(1, unk, 16);
        }
    }

    return 0;
}
