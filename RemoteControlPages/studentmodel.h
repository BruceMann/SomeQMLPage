#ifndef STUDENTMODEL_H
#define STUDENTMODEL_H

#include <QAbstractListModel>

class StudentModel:public QAbstractListModel
{
    Q_OBJECT

public:
    enum InfoRole{
        FullNameRole = Qt::DisplayRole,
        GenderRole,

    };
    Q_ENUM(InfoRole)

    StudentModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex & = QModelIndex()) const;
    QVariant data(const QModelIndex &index,int role = Qt::DisplayRole) const;
    QHash<int,QByteArray> roleNames() const;

    Q_INVOKABLE QVariantMap get(int row) const;
    Q_INVOKABLE void append(const QString &name,const QString &gender);
    Q_INVOKABLE void set(int row,const QString &name,const QString &gender);
    Q_INVOKABLE void remove(int row);


private:
    struct StudentInfo
    {
        QString name;
        QString gender;

    };

    QList<StudentInfo> m_info;
};

#endif // STUDENTMODEL_H
