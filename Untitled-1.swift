/*
Személyes pénzügy elemző alkalmazás iOS-re (iPhone 15 Pro-hoz is)!

**Leírás**:  
Ez az alkalmazás lehetővé teszi:
- Jelenlegi tőke egyenleg megadását
- Havi fix kiadások és bevételek rögzítését kategóriákkal
- Fix kiadások és fix bevételek kategóriák létrehozását
- Szabad felhasználású diákhitel egyenleg megadását
- A diákhitel tartozás jövőbeni alakulásának számítását és grafikos ábrázolását

Az alábbi példa SwiftUI-t használ. Egy alap pénzügyi modellezőt valósít meg, egyszerűsített szimulációval, amelyet igényeid szerint továbbfejleszthetsz.

*/

import SwiftUI
import Charts

// Modellek

struct Category: Identifiable, Hashable {
    let id = UUID()
    var name: String
}

struct FixedTransaction: Identifiable, Hashable {
    let id = UUID()
    var amount: Double
    var category: Category
    var isIncome: Bool
}

// Main ViewModel

class FinanceViewModel: ObservableObject {
    @Published var capitalBalance: Double = 0.0
    @Published var studentLoanBalance: Double = 0.0

    @Published var fixedCategories: [Category] = [
        Category(name: "Lakhatás"),
        Category(name: "Étkezés"),
        Category(name: "Közlekedés"),
        Category(name: "Fizetés"),
        Category(name: "Diákhitel")
    ]
    @Published var fixedTransactions: [FixedTransaction] = []
    
    // Kategóriák létrehozása
    func addCategory(name: String) {
        let cat = Category(name: name)
        if !fixedCategories.contains(cat) {
            fixedCategories.append(cat)
        }
    }
    
    func addTransaction(amount: Double, category: Category, isIncome: Bool) {
        fixedTransactions.append(FixedTransaction(amount: amount, category: category, isIncome: isIncome))
    }
    
    // Jövőbeli tartozás szimuláció
    // Egyszerű kamatos számítás (pl. 5% kamat, 12 hónapra)
    func calculateStudentLoanProjection(months: Int = 12, monthlyInterest: Double = 0.004) -> [Double] {
        var projection = [studentLoanBalance]
        let monthlyPayment = fixedTransactions.filter { !$0.isIncome && $0.category.name.lowercased().contains("diákhitel") }.reduce(0.0) { $0 + $1.amount }
        var currentBalance = studentLoanBalance
        
        for _ in 1...months {
            currentBalance = currentBalance * (1 + monthlyInterest) - monthlyPayment
            projection.append(max(currentBalance, 0))
        }
        return projection
    }
}

// SwiftUI nézetek

@main
struct PersonalFinanceApp: App {
    var body: some Scene {
        WindowGroup {
            FinanceMainView()
        }
    }
}

struct FinanceMainView: View {
    @StateObject private var model = FinanceViewModel()
    @State private var newCategory: String = ""
    @State private var amount: String = ""
    @State private var selectedCategory: Category?
    @State private var isIncome = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Egyenlegek megadása
                    GroupBox("Alap adatok") {
                        HStack {
                            Text("Jelenlegi tőke egyenleg:")
                            TextField("Ft", value: $model.capitalBalance, formatter: NumberFormatter())
                                .frame(width: 100)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Text("Szabad felhasználású diákhitel egyenleg:")
                            TextField("Ft", value: $model.studentLoanBalance, formatter: NumberFormatter())
                                .frame(width: 100)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                    
                    GroupBox("Új fix kiadás/bevétel") {
                        HStack {
                            Toggle("Bevétel", isOn: $isIncome)
                                .toggleStyle(SwitchToggleStyle())
                            TextField("Összeg", text: $amount)
                                .keyboardType(.decimalPad)
                                .frame(width: 80)
                            Picker("Kategória", selection: $selectedCategory) {
                                ForEach(model.fixedCategories) { cat in
                                    Text(cat.name).tag(cat as Category?)
                                }
                            }
                            Button("Hozzáad") {
                                if let selectedCategory = selectedCategory, let amountValue = Double(amount) {
                                    model.addTransaction(amount: amountValue, category: selectedCategory, isIncome: isIncome)
                                    amount = ""
                                    selectedCategory = nil
                                }
                            }
                        }
                    }
                    
                    GroupBox("Új kategória hozzáadása") {
                        HStack {
                            TextField("Kategória név", text: $newCategory)
                            Button("Hozzáad") {
                                model.addCategory(name: newCategory)
                                newCategory = ""
                            }
                        }
                    }
                    
                    GroupBox("Fix kiadások és bevételek listája") {
                        ForEach(model.fixedTransactions) { trans in
                            HStack {
                                Text(trans.category.name)
                                Spacer()
                                Text(trans.isIncome ? "+" : "-")
                                    .foregroundColor(trans.isIncome ? .green : .red)
                                Text("\(Int(trans.amount)) Ft")
                            }
                        }
                    }
                    
                    GroupBox("Diákhitel tartozás jövőbeli alakulása") {
                        LoanChartView(projection: model.calculateStudentLoanProjection())
                            .frame(height: 220)
                    }
                }
                .padding()
            }
            .navigationTitle("Pénzügy Elemző")
        }
    }
}

// Egyszerű grafikon

struct LoanChartView: View {
    var projection: [Double]
    var body: some View {
        Chart {
            ForEach(Array(projection.enumerated()), id: \.offset) { idx, value in
                LineMark(
                    x: .value("Hónap", idx),
                    y: .value("Hitel összeg (Ft)", value)
                )
                    .foregroundStyle(Color.red)
            }
        }
        .chartYScale(domain: 0...(projection.max() ?? 1))
        .chartXAxisLabel("Hónap")
        .chartYAxisLabel("Tartozás (Ft)")
    }
}



