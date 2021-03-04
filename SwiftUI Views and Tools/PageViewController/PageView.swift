//
//  PageView.swift
//  SwiftUI Views and Tools
//
//  Created by Steven Zhang on 3/4/21.
//

import SwiftUI

struct PageView<Item: View>: View {
    var items: [Item]
    var cornerRadius: CGFloat
    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack {
            PageViewController(pages: items, currentPage: $selectedIndex)
                .cornerRadius(cornerRadius)
            PageControl(numberOfPages: items.count, currentPage: $selectedIndex)
        }
    }
}

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let controller = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        controller.dataSource = context.coordinator
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ parent: PageViewController) {
            self.parent = parent
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                parent.currentPage = index
            }
        }
    }
}

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(context.coordinator, action: #selector(Coordinator.updateCurrentPage(sender:)), for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var parent: PageControl
        
        init(_ parent: PageControl) {
            self.parent = parent
        }
        
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            parent.currentPage = sender.currentPage
        }
    }
}


// MARK: - Test

struct PageViewTest: View {
    @State var index = 3
    let pairs = [(Color.red, "🍎"), (Color.blue, "🍊"), (Color.yellow, "🦄"), (Color.purple, "🐼"), (Color.orange, "🎾"), (Color.green, "🍈")]
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30).fill(Color.gray)
            PageView(items: pairs.map{ PageItemView(pair: $0) }, cornerRadius: 20, selectedIndex: $index)
                .frame(width: 600, height: 800)
        }
    }
}

struct PageItemView: View {
    var pair: (Color, String)
    var body: some View {
        ZStack {
            Rectangle()
                .fill(pair.0)
            Text(pair.1)
                .font(.system(size: 200))
        }
    }
}

struct PageViewTest_Previews: PreviewProvider {
    static var previews: some View {
        PageViewTest()
    }
}
