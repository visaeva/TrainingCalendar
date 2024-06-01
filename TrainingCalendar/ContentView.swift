import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CalendarViewModel()
    
    var body: some View {
        ZStack {
            Color.blackBack
                .ignoresSafeArea()
            VStack (spacing: 20){
                Text("Training plan")
                    .font(.title)
                    .padding(.leading, 24)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack {
                    Text("January 2024")
                        .font(.system(size: 16))
                        .padding(.leading, 24)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "calendar")
                        .foregroundColor(.white)
                        .padding(.trailing, 24)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(getDaysInMonth(), id: \.self) { day in
                            CalendarView(dayOfWeek: getDayOfWeek(dayOfMonth: day), dayOfMonth: day, selectedDay: $viewModel.selectedDay, trainingDays: $viewModel.trainingDays)
                        }
                    }
                    .padding(.horizontal, 20)
                }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Activities")
                            .font(.system(size: 16))
                            .padding(.leading, 24)
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 30)
                        
                        ForEach(viewModel.filteredActivities(forDay: viewModel.selectedDay), id: \.self) { activity in
                            ActivitiesView(
                                activityName: activity.activityName,
                                distance: activity.distance,
                                description: activity.description,
                                date: activity.date,
                                dayOfWeek: activity.dayOfWeek,
                                image: activity.image
                            )
                        }
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            viewModel.setTrainingDays()
        }
    }
    
    func getDaysInMonth() -> [Int] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: Date())!
        return Array(range.lowerBound..<range.upperBound)
    }
    
    func getDayOfWeek(dayOfMonth: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let dateString = "2024/01/\(dayOfMonth)"
        if let date = formatter.date(from: dateString) {
            let calendar = Calendar.current
            let dayOfWeek = calendar.component(.weekday, from: date)
            return formatter.shortWeekdaySymbols[dayOfWeek - 1]
        }
        return ""
    }
}

#Preview {
    ContentView()
}
