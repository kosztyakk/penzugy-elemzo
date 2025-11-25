// Adatmodell
let financeData = {
    capitalBalance: 0,
    studentLoanBalance: 0,
    categories: ['Lakhatás', 'Étkezés', 'Közlekedés', 'Fizetés', 'Diákhitel'],
    transactions: []
};

// LocalStorage kezelés
function loadData() {
    const saved = localStorage.getItem('financeData');
    if (saved) {
        financeData = JSON.parse(saved);
    }
    updateUI();
}

function saveData() {
    localStorage.setItem('financeData', JSON.stringify(financeData));
    updateUI();
}

// UI frissítés
function updateUI() {
    // Egyenlegek
    document.getElementById('capitalBalance').value = financeData.capitalBalance || '';
    document.getElementById('studentLoanBalance').value = financeData.studentLoanBalance || '';

    // Kategóriák
    const categorySelect = document.getElementById('categorySelect');
    categorySelect.innerHTML = '<option value="">Válassz kategóriát</option>';
    financeData.categories.forEach(cat => {
        const option = document.createElement('option');
        option.value = cat;
        option.textContent = cat;
        categorySelect.appendChild(option);
    });

    // Tranzakciók
    updateTransactionsList();
    updateChart();
}

function updateTransactionsList() {
    const list = document.getElementById('transactionsList');
    
    if (financeData.transactions.length === 0) {
        list.innerHTML = '<p class="empty-state">Még nincsenek tranzakciók</p>';
        return;
    }

    list.innerHTML = financeData.transactions.map((trans, index) => {
        const sign = trans.isIncome ? '+' : '-';
        const colorClass = trans.isIncome ? 'income' : 'expense';
        return `
            <div class="transaction-item">
                <span class="transaction-category">${trans.category}</span>
                <span class="transaction-amount ${colorClass}">
                    ${sign} ${formatCurrency(trans.amount)} Ft
                </span>
            </div>
        `;
    }).join('');
}

function updateChart() {
    const ctx = document.getElementById('loanChart').getContext('2d');
    
    // Töröljük a korábbi chartot, ha létezik
    if (window.loanChartInstance) {
        window.loanChartInstance.destroy();
    }

    const projection = calculateStudentLoanProjection();
    
    window.loanChartInstance = new Chart(ctx, {
        type: 'line',
        data: {
            labels: Array.from({ length: projection.length }, (_, i) => `Hónap ${i}`),
            datasets: [{
                label: 'Tartozás (Ft)',
                data: projection,
                borderColor: '#FF3B30',
                backgroundColor: 'rgba(255, 59, 48, 0.1)',
                borderWidth: 2,
                fill: true,
                tension: 0.4
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return formatCurrency(value) + ' Ft';
                        }
                    }
                }
            }
        }
    });
}

// Diákhitel számítás
function calculateStudentLoanProjection(months = 12, monthlyInterest = 0.004) {
    const projection = [financeData.studentLoanBalance || 0];
    const monthlyPayment = financeData.transactions
        .filter(t => !t.isIncome && t.category.toLowerCase().includes('diákhitel'))
        .reduce((sum, t) => sum + t.amount, 0);
    
    let currentBalance = financeData.studentLoanBalance || 0;
    
    for (let i = 1; i <= months; i++) {
        currentBalance = currentBalance * (1 + monthlyInterest) - monthlyPayment;
        projection.push(Math.max(currentBalance, 0));
    }
    
    return projection;
}

// Funkciók
function addCategory() {
    const input = document.getElementById('newCategory');
    const name = input.value.trim();
    
    if (name && !financeData.categories.includes(name)) {
        financeData.categories.push(name);
        saveData();
        input.value = '';
    }
}

function addTransaction() {
    const amount = parseFloat(document.getElementById('amount').value);
    const category = document.getElementById('categorySelect').value;
    const isIncome = document.getElementById('isIncome').checked;
    
    if (amount && category) {
        financeData.transactions.push({
            amount: amount,
            category: category,
            isIncome: isIncome
        });
        saveData();
        
        document.getElementById('amount').value = '';
        document.getElementById('categorySelect').value = '';
        document.getElementById('isIncome').checked = false;
    }
}

function formatCurrency(value) {
    return new Intl.NumberFormat('hu-HU').format(Math.round(value));
}

// Event listeners
document.getElementById('capitalBalance').addEventListener('change', (e) => {
    financeData.capitalBalance = parseFloat(e.target.value) || 0;
    saveData();
});

document.getElementById('studentLoanBalance').addEventListener('change', (e) => {
    financeData.studentLoanBalance = parseFloat(e.target.value) || 0;
    saveData();
});

// Inicializálás
loadData();

