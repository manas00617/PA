#include <GL/glut.h>
#include <cmath>

// Ball position and velocity
float x = -0.5f, y = 0.0f;
float vx = 0.001f, vy = 0.02f;
float gravity = -0.0005f;
float radius = 0.05f;

void drawBall(float x, float y) {
    int segments = 100;
    glBegin(GL_TRIANGLE_FAN);
    glColor3f(1.0, 0.2, 0.2); // Red color
    glVertex2f(x, y);
    for (int i = 0; i <= segments; i++) {
        float angle = i * 2.0f * 3.14159f / segments;
        glVertex2f(x + cos(angle) * radius, y + sin(angle) * radius);
    }
    glEnd();
}

void display() {
    glClear(GL_COLOR_BUFFER_BIT);
    drawBall(x, y);
    glutSwapBuffers();
}

void update(int value) {
    // Apply gravity and update position
    vy += gravity;
    y += vy;
    x += vx;

    // Bounce on bottom
    if (y - radius <= -1.0f) {
        y = -1.0f + radius;
        vy = -vy; // No energy loss for continuous bounce
    }

    // Reflect on side walls
    if (x + radius > 1.0f || x - radius < -1.0f) {
        vx = -vx;
    }

    glutPostRedisplay();
    glutTimerFunc(16, update, 0); // call update ~60 times per second
}

void init() {
    glClearColor(0.0, 0.0, 0.0, 1.0); // Black background
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(-1, 1, -1, 1);
}

int main(int argc, char** argv) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
    glutInitWindowSize(600, 600);
    glutCreateWindow("Continuous Bouncing Ball");

    init();
    glutDisplayFunc(display);
    glutTimerFunc(0, update, 0);

    glutMainLoop();
    return 0;
}

