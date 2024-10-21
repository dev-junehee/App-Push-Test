//
//  FirstWidget.swift
//  FirstWidget
//
//  Created by junehee on 10/21/24.
//

import WidgetKit
import SwiftUI

/**
 `Provider` : 프로토콜
 */
struct Provider: TimelineProvider {
    // 위젯킷이 최초로 등록하고 사용할 때(렌더링 될 때) 사용 - 임시 데이터
    // 보통은 스켈레톤뷰로 보여줬다가 실제 데이터로 전환
    // 만약 잠금화면에서 데이터를 안 보여주고 싶다면, 잠금 해제 전까지 가짜 데이터를 보여줄 수 있음 (Placeholder 역할)
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), emoji: "😀")
    }

    // 위젯 갤러리에서 미리보기 화면에 등장하는 데이터
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), emoji: "미리보이나용?")
        completion(entry)
    }

    // 위젯 타임라인 정책
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, emoji: "😀")
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

/**
 `Entry` : 위젯을 구성하는데 필요한 데이터
 
 `TimelineEntry`는 프로토콜
 - date: 위젯을 다시 그려주는데 필요한 시간, 스마트스택에서 시간, score
 */
struct SimpleEntry: TimelineEntry {
    let date: Date
    let emoji: String
}

/**
 `EntryView` : 실제 화면 담당
 */
struct FirstWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Image(systemName: "star.fill")
            Text("Time:")
            Text(entry.date, style: .time)

            // 앱 그룹으로 저장한 UD 가져오기
            Text(UserDefaults(suiteName: "group.com.junehee.test")?.string(forKey: "nickname") ?? "이름없음")
            
            Text("Emoji:")
            Text(entry.emoji)
        }
    }
}

/**
 `Widget`: 위젯의 크기, 위젯 갤러리, Configuration을 담당하는 구조체
 */
struct FirstWidget: Widget {
    let kind: String = "FirstWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                FirstWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                FirstWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("위젯 이름이여요")
        .description("이러쿵 저러쿵 위젯을 사용해 보세용~!")
    }
}

#Preview(as: .systemSmall) {
    FirstWidget()
} timeline: {
    SimpleEntry(date: .now, emoji: "😀")
    SimpleEntry(date: .now, emoji: "🤩")
}
