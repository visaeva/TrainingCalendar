import SwiftUI

class CalendarViewModel: ObservableObject {
    @Published var selectedDay: Int? = nil
    @Published var trainingDays: Set<Int> = []
    @Published var activities: [Activity] = []
    
    init() {
        fetchActivities()
        setTrainingDays()
    }
    
    func setTrainingDays() {
        for activity in activities {
            if let day = Int(activity.date) {
                trainingDays.insert(day)
            }
        }
    }
    
    func fetchActivities() {
        activities = [
            Activity(activityName: "Intervals", distance: "8 km", description: "200/400 rest", date: "1", dayOfWeek: "MON", image: "interval"),
            Activity(activityName: "Easy run", distance: "10 km", description: "HR zone 2", date: "3", dayOfWeek: "WED", image: "run"),
            Activity(activityName: "Tempo run", distance: "6 km", description: "HR zone 3-4", date: "5", dayOfWeek: "FRI", image: "runFast"),
            Activity(activityName: "Longrun", distance: "17 km", description: "65%", date: "6", dayOfWeek: "SAT", image: "longRun"),
            Activity(activityName: "Strength training", distance: "1 hour", description: "dumbbells, free weights", date: "8", dayOfWeek: "MON", image: "strength"),
            
            Activity(activityName: "Intervals", distance: "8 km", description: "200/400 rest", date: "15", dayOfWeek: "MON", image: "interval"),
            Activity(activityName: "Easy run", distance: "10 km", description: "HR zone 2", date: "10", dayOfWeek: "WED", image: "run"),
            Activity(activityName: "Tempo run", distance: "6 km", description: "HR zone 3-4", date: "12", dayOfWeek: "FRI", image: "runFast"),
            Activity(activityName: "Longrun", distance: "17 km", description: "65%", date: "13", dayOfWeek: "SAT", image: "longRun"),
            Activity(activityName: "Strength training", distance: "1 hour", description: "dumbbells, free weights", date: "22", dayOfWeek: "MON", image: "strength"),
            
            Activity(activityName: "Intervals", distance: "8 km", description: "200/400 rest", date: "22", dayOfWeek: "MON", image: "interval"),
            Activity(activityName: "Easy run", distance: "10 km", description: "HR zone 2", date: "24", dayOfWeek: "WED", image: "run"),
            Activity(activityName: "Tempo run", distance: "6 km", description: "HR zone 3-4", date: "26", dayOfWeek: "FRI", image: "runFast"),
            Activity(activityName: "Longrun", distance: "17 km", description: "65%", date: "27", dayOfWeek: "SAT", image: "longRun"),
            Activity(activityName: "Strength training", distance: "1 hour", description: "dumbbells, free weights", date: "29", dayOfWeek: "MON", image: "strength")
        ]
    }
    
    func filteredActivities(forDay day: Int?) -> [Activity] {
        guard let day = day else { return activities }
        return activities.filter { Int($0.date) == day }
    }
}
