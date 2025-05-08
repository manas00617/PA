#include <GL/glut.h>
#include <math.h>

// 3 Control points (Quadratic Bézier)
float ctrlPoints[3][2] = {
    {-0.9, -0.9},
    { 0.0,  0.9},
    { 0.9, -0.9}
};

void drawBezierCurve() {
    glBegin(GL_LINE_STRIP);
    for (float t = 0.0; t <= 1.0; t += 0.001) {
        float u = 1 - t;

        float x = u * u * ctrlPoints[0][0] +
                  2 * u * t * ctrlPoints[1][0] +
                  t * t * ctrlPoints[2][0];

        float y = u * u * ctrlPoints[0][1] +
                  2 * u * t * ctrlPoints[1][1] +
                  t * t * ctrlPoints[2][1];

        glVertex2f(x, y);
    }
    glEnd();
}

void display() {
    glClear(GL_COLOR_BUFFER_BIT);

    glColor3f(1.0, 1.0, 0.0); // Yellow curve
    drawBezierCurve();

    glColor3f(1.0, 0.0, 0.0); // Red control points
    glPointSize(5.0);
    glBegin(GL_POINTS);
    for (int i = 0; i < 3; i++)
        glVertex2f(ctrlPoints[i][0], ctrlPoints[i][1]);
    glEnd();

    glFlush();
}

void init() {
    glClearColor(0, 0, 0, 1);           // Background black
    gluOrtho2D(-1.0, 1.0, -1.0, 1.0);   // 2D view
}

int main(int argc, char** argv) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);
    glutInitWindowSize(800, 600);
    glutCreateWindow("Simple Bézier Curve");
    init();
    glutDisplayFunc(display);
    glutMainLoop();
    return 0;
}

