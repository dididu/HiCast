import Qt 4.7

Rectangle {

//    signal getEpisodeStatus; // new / partly listened / listened
//    function updateEpisodeStatus(txt) { episodeStatus = txt }  // slot

    property string episodeStatus: "--"
    property int listHeight: 200

    height: listHeight
    width: parent.width
    color: "black"

    ListView {
        id: episodeList

        //anchors.fill: parent
        height: listHeight
        width: parent.width

        model: xmlModel
        delegate: EpisodeDelegate { }
        //clip: true
    }

    XmlListModel {
         id: xmlModel
         //source: "http://feeds.rucast.net/radio-t"
         source: "radio-t.xml"
         query: "/rss/channel/item"

         XmlRole { name: "title"; query: "title/string()" }
         XmlRole { name: "pubDate"; query: "pubDate/string()" }
         XmlRole { name: "mp3Url"; query: "enclosure/@url/string()" }
     }
}
