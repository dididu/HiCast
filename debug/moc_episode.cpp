/****************************************************************************
** Meta object code from reading C++ file 'episode.h'
**
** Created: Fri 1. Oct 09:26:59 2010
**      by: The Qt Meta Object Compiler version 62 (Qt 4.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../episode.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'episode.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 62
#error "This file was generated using the moc from 4.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_Episode[] = {

 // content:
       5,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       6,   24, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: signature, parameters, type, tag, flags
       9,    8,    8,    8, 0x05,

 // methods: signature, parameters, type, tag, flags
      25,    8,    8,    8, 0x02,

 // properties: name, type, flags
      49,   41, 0x0a095103,
      54,   41, 0x0a095103,
      70,   66, 0x02095103,
      77,   66, 0x02095103,
      82,   66, 0x02095103,
      91,   66, 0x02095103,

       0        // eod
};

static const char qt_meta_stringdata_Episode[] = {
    "Episode\0\0statusUpdated()\0updateEpisode()\0"
    "QString\0name\0podcastName\0int\0status\0"
    "size\0duration\0playPosition\0"
};

const QMetaObject Episode::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Episode,
      qt_meta_data_Episode, 0 }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &Episode::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *Episode::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *Episode::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_Episode))
        return static_cast<void*>(const_cast< Episode*>(this));
    return QObject::qt_metacast(_clname);
}

int Episode::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: statusUpdated(); break;
        case 1: updateEpisode(); break;
        default: ;
        }
        _id -= 2;
    }
#ifndef QT_NO_PROPERTIES
      else if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = name(); break;
        case 1: *reinterpret_cast< QString*>(_v) = podcastName(); break;
        case 2: *reinterpret_cast< int*>(_v) = status(); break;
        case 3: *reinterpret_cast< int*>(_v) = size(); break;
        case 4: *reinterpret_cast< int*>(_v) = duration(); break;
        case 5: *reinterpret_cast< int*>(_v) = playPosition(); break;
        }
        _id -= 6;
    } else if (_c == QMetaObject::WriteProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: setName(*reinterpret_cast< QString*>(_v)); break;
        case 1: setPodcastName(*reinterpret_cast< QString*>(_v)); break;
        case 2: setStatus(*reinterpret_cast< int*>(_v)); break;
        case 3: setSize(*reinterpret_cast< int*>(_v)); break;
        case 4: setDuration(*reinterpret_cast< int*>(_v)); break;
        case 5: setPlayPosition(*reinterpret_cast< int*>(_v)); break;
        }
        _id -= 6;
    } else if (_c == QMetaObject::ResetProperty) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Episode::statusUpdated()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}
QT_END_MOC_NAMESPACE
