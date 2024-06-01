
import SwiftUI

struct ActivitiesView: View {
    let imageHeight: Double = 48
    let imageWidth: Double = 48
    var activityName: String
    var distance: String
    var description: String
    var date: String
    var dayOfWeek: String
    var image: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth, height: imageHeight)
                .padding(.leading, 24)
            
            VStack(alignment: .leading) {
                Text(activityName)
                    .foregroundColor(.white)
                HStack {
                    Text(distance)
                        .foregroundColor(.grayText)
                        .font(.system(size: 14))
                    Text(description)
                        .foregroundColor(.grayText)
                        .font(.system(size: 14))
                        .lineLimit(1)
                }
            }
            .padding(.leading, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .trailing) {
                Text(date)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Text(dayOfWeek)
                    .foregroundColor(.grayText)
                    .font(.system(size: 11))
            }
            .padding(.trailing, 24)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.vertical, 10)
        .background(Color.blackBack)
    }
}

#Preview {
    ActivitiesView(activityName: "Strength training", distance: "1 hour", description: "dumbbells, free weights", date: "29", dayOfWeek: "Mon", image: "strength")
}
