// 1. ���� ������� � ������ ��� � �� ����������. ���� ������� �����, ������� ����� �������� ��� (����� ����������� � � ���� ������� ����� ���, ������� ����� ��������).
// ���������� ��������������� �������� � ������� ������� �������� ���������� (���������� ������� ��� ����� �� �������, ���, ������� �� �������, � ���������).

// ���� ���
enum Tea {
    case black
    case green
    case red
    case white
}

// ��������� ���
let teaPrices: [Tea: Int] = [
    .black: 150,
    .green: 120,
    .red: 180,
    .white: 200
]

// ������� ����� (�������)
var teaOrders: [Tea] = [.green, .red, .green, .black, .white, .green]

// ����������� ������
for (i, v) in teaOrders.enumerated() {
    print("\(i + 1). ���: \(v), ���������: \(teaPrices[v])")
}
/*
1. ���: green, ���������: 120
2. ���: red, ���������: 180
3. ���: green, ���������: 120
4. ���: black, ���������: 150
5. ���: white, ���������: 200
6. ���: green, ���������: 120
*/





// 2. ���� ������ [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]. ���������� ������� ����� ������, ������� ����� �������� �� ��������� �������, �� �� ������ ���� nil, �� ������ ���� 0 � 4, � ����� ������ ������ ���� ������������ �� �����������.

var a: [Int?] = [-4, 5, 10, nil, 4, nil, 25, 0, nil, 16, 75, -20, -7, 15, 0, nil]

//var aModified = a.compactMap { Int($0) } // ��� ����� ������

var aModified = a.compactMap { $0 != nil ? Int($0!) : nil }.sorted(by: <)

print(aModified) // [-20, -7, -4, 0, 0, 4, 5, 10, 15, 16, 25, 75]


// ������ ������:

var aModified: [Int] = []

for el in a {
    if let v = el, v != 0, v != 4 {
        aModified.append(v)
    }
}

print(aModified.sorted(by: <)) // [-20, -7, -4, 0, 0, 4, 5, 10, 15, 16, 25, 75]





// 3. �������� �������, ������� �� ���� ��������� ����� �����, � ���������� ������, ������� ����������� �� ��������� ��������: ���������� ��������� ������������� ����������� �����, ������ ���������� � 1, ������ ����������� ������� ������ ����������� � 2 ����.

func myFunc(x: Int) -> [Int] {
    
    var arr: [Int] = []
    
    var v = 1
    
    for _ in 1...x {
        
        arr.append(v)
        
        v = v * 2
    }
    
    return arr
}

print(myFunc(x: 10)) // [1, 2, 4, 8, 16, 32, 64, 128, 256, 512]


// ���������� ����� ������ ����� ��������:

var arr: [Int] = []

var a = 10

func myFunc(i: Int) -> Void {

    arr.append(i)
    
    if arr.count < a {
        myFunc(i: i * 2)
    }
}

myFunc(i: 1)

print(arr) // [1, 2, 4, 8, 16, 32, 64, 128, 256, 512]
