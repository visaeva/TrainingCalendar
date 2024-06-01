import SwiftUI

struct CalendarView: View {
    let dayOfWeek: String
    let dayOfMonth: Int
    
    @Binding var selectedDay: Int?
    @Binding var trainingDays: Set<Int>
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .foregroundColor(.white)
                .foregroundColor(.white)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .center)
                .minimumScaleFactor(0.5)
                .font(.system(size: 11))
            Text("\(dayOfMonth)")
                .foregroundColor(.white)
                .foregroundColor(.white)
                .font(.system(size: 14))
                .frame(maxWidth: .infinity, alignment: .center)
                .minimumScaleFactor(0.5)
        }
        .padding()
        .frame(width: 44, height: 72)
        .background(trainingDays.contains(dayOfMonth) || selectedDay == dayOfMonth ? Color.purpleDay : Color.dayBlack)
        .cornerRadius(100)
        .padding(6)
        .overlay(
            RoundedRectangle(cornerRadius: 104)
                .stroke(.grayText, lineWidth: 2)
                .opacity(trainingDays.contains(dayOfMonth) || selectedDay == dayOfMonth ? 1 : 0)
        )
        .onTapGesture {
            if selectedDay == dayOfMonth {
                selectedDay = nil
            } else {
                selectedDay = dayOfMonth
            }
        }
    }
}

#Preview {
    CalendarView(dayOfWeek: "Mon", dayOfMonth: 22, selectedDay: .constant(nil), trainingDays: .constant(Set([22, 24, 26, 27, 29])))
}
