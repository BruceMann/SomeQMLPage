#include "studentmodel.h"

#include <QDebug>

StudentModel::StudentModel(QObject *parent):QAbstractListModel(parent)
{
    qDebug()<<"StudentModel constracted";

    m_info.append({"bruce","man"});
    m_info.append({"bruce2","man"});
    m_info.append({"bruce3","man"});
    m_info.append({"bruce4","man"});
    m_info.append({"bruce5","man"});

    m_info.append({"Jane","woman"});
    m_info.append({"Jane2","woman"});
    m_info.append({"Jane3","woman"});
    m_info.append({"Jane4","woman"});
    m_info.append({"Jane5","woman"});
}

int StudentModel::rowCount(const QModelIndex &) const
{
    return m_info.count();
}

QVariant StudentModel::data(const QModelIndex &index, int role) const
{
    if(index.row()<rowCount())
        switch(role){
        case FullNameRole:return m_info.at(index.row()).name;
        case GenderRole:return m_info.at(index.row()).gender;
        default:return QVariant();
        }
    return QVariant();
}

QHash<int, QByteArray> StudentModel::roleNames() const
{
    static const QHash<int,QByteArray>roles{
         {FullNameRole,"name"},
         {GenderRole,"gender"}
    };
    return roles;
}

QVariantMap StudentModel::get(int row) const
{
    const StudentInfo info = m_info.value(row);
    return {{"name",info.name},{"gender",info.gender}};
}

void StudentModel::append(const QString &name, const QString &gender)
{
    int row = 0;
    while(row<m_info.count()&&name>m_info.at(row).name)
        ++row;

    beginInsertRows(QModelIndex(),row,row);
    m_info.insert(row,{name,gender});
    endInsertRows();
}

void StudentModel::set(int row, const QString &name, const QString &gender)
{
    if(row<0||row>=m_info.count())
        return;

    m_info.replace(row,{name,gender});
    dataChanged(index(row,0),index(row,0),{FullNameRole,GenderRole});
}

void StudentModel::remove(int row)
{
    if(row<0||row>=m_info.count())
        return;

    beginRemoveRows(QModelIndex(),row,row);
    m_info.removeAt(row);
    endRemoveRows();
}


