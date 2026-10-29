#ifndef APPLICANT_H
#define APPLICANT_H

#include <QObject>
#include <QString>
#include <QList>

struct Subject
{
    qint32 score;
    QString subjectName;
    ~Subject() {}
};

class Applicant : public QObject
{
    Q_OBJECT
    // Свойства Applicant
    Q_PROPERTY(QString fullName READ getFullName WRITE setFullName NOTIFY fullNameChanged)
    Q_PROPERTY(qreal gpa READ getGPA WRITE setGPA NOTIFY gpaChanged)

public:
    explicit Applicant(QObject *parent = nullptr)
        : QObject(parent), m_gpa(0.0) {}
    virtual ~Applicant() {}

    // Геттер для имени
    QString getFullName() const { return m_fullName; }

    // Сеттер для имени
    void setFullName(const QString &val)
    {
        m_fullName = val;
        emit fullNameChanged();
    }

    // Геттер для среднего балла
    qreal getGPA() const { return m_gpa; }

    // Сеттер для среднего балла
    void setGPA(qreal points)
    {
        m_gpa = points;
        emit gpaChanged();
    }

    // Подсчёт итогового балла
    Q_INVOKABLE virtual qint32 countTotalScore() = 0;

signals:
    void fullNameChanged();
    void gpaChanged();
    void totalScoreCounted();

private:
    QString m_fullName;     // ФИО
    qreal m_gpa;            // средний балл
};

// Поступающий в ССУЗ
class CollegeApplicant : public Applicant
{
public:
    explicit CollegeApplicant(QObject *parent = nullptr)
        : Applicant(parent) {}

    qint32 countTotalScore() override;
};

// Поступающий в ВУЗ
class UniversityApplicant : public Applicant
{
public:
    explicit UniversityApplicant(QObject *parent = nullptr)
        : Applicant(parent) {}

    void addSubject(const Subject &subject);

    qint32 countTotalScore() override;

private:
    QList<Subject> subjects;
};

#endif // APPLICANT_H
