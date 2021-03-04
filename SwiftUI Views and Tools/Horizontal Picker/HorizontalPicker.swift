//
//  HorizontalPicker.swift
//  SwiftUI Views and Tools
//
//  Created by Steven Zhang on 3/4/21.
//

import SwiftUI
import UIKit

struct HorizontalPicker<Item: View>: UIViewRepresentable {
    var items: [Item]
    var rowWidth: CGFloat
    @Binding var selected: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<HorizontalPicker>) -> UIPickerView {
        let picker = UIPickerView(frame: .zero)

        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        
        // Rotate PickerView to horizontal
        let rotatingAngle: CGFloat! = -90 * (.pi/180)
        picker.transform = CGAffineTransform(rotationAngle: rotatingAngle)
        picker.autoresizesSubviews = true
        return picker
    }

    func updateUIView(_ view: UIPickerView, context: UIViewRepresentableContext<HorizontalPicker>) {
        // Update the selected row in picker view based on `selected`'s value
        view.selectRow(selected, inComponent: 0, animated: false)
    }

    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: HorizontalPicker

        init(_ pickerView: HorizontalPicker) {
            self.parent = pickerView
        }

        // Set row height
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return parent.rowWidth
        }

        // How many rows
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }

        // How many items
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.parent.items.count
        }

        // Return selected row's value
//        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//            return self.parent.data[row]
//        }

        // Selected a row
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            self.parent.selected = row
        }
        
        // set Any custom UI view to the row
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//            let label = UILabel()
//            label.text = parent.data[row]
//            label.textAlignment = .center
//            label.adjustsFontSizeToFitWidth = true
//            label.numberOfLines = 1
//
//            label.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
//            return label
            if let view = UIHostingController(rootView: parent.items[row]).view {
                view.transform = CGAffineTransform(rotationAngle: 90 * (.pi/180))
                view.contentMode = .scaleAspectFit
                return view
            } else {
                return UIView()
            }
        }
    }
}


struct HorizontalPickerTestView: View {
    let data = ["🍎", "🍊", "🦄", "🐼", "🎾", "😜", "😠", "🍈", "🍡", "🥚"]
    @State var selected = 5
    let length: CGFloat = 80
    
    var body: some View {
        VStack {
            Text("Selected Index: \(selected)").font(.headline)
            HorizontalPicker(items: data.map{ Text($0).font(.system(size: length/2)) },
                             rowWidth: length,
                             selected: $selected)
                .frame(height: length)
                .clipped()
            Text("Selected Emoji: \(data[selected])").font(.headline)
        }
        
    }
    
}

struct HorizontalPickerTestView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalPickerTestView()
    }
}
