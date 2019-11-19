defmodule VendingMachine.MakeItemStock do
  @item %{
    A1: %{name: "Coke", display: "🍹", department: "Soft Drink", price: 1.0, quantity: 20},
    A2: %{name: "Sprite", display: "🍹", department: "Soft Drink", price: 0.5, quantity: 20},
    A3: %{name: "Pepsi", display: "🍹", department: "Soft Drink", price: 0.65, quantity: 20},
    A4: %{name: "Mtn Dew", display: "🍹", department: "Soft Drink", price: 1.0, quantity: 20},
    A5: %{name: "Dr Thunder", display: "🍹", department: "Soft Drink", price: 0.5, quantity: 20},
    A6: %{name: "Sams Cola", display: "🍹", department: "Soft Drink", price: 0.65, quantity: 20},
    A7: %{name: "Twist Up", display: "🍹", department: "Soft Drink", price: 1.0, quantity: 20},
    A8: %{name: "Crush Orange", display: "🍹", department: "Soft Drink", price: 0.5, quantity: 20},
    A9: %{name: "Fanta", display: "🍹", department: "Soft Drink", price: 0.65, quantity: 20},
    A10: %{name: "Coca Cola", display: "🍹", department: "Soft Drink", price: 2.65, quantity: 20},
    B1: %{name: "Cheetos", display: "🍿", department: "Snacks", price: 1.0, quantity: 20},
    B2: %{name: "Lays", display: "🍿", department: "Snacks", price: 0.5, quantity: 20},
    B3: %{name: "Pingles", display: "🍿", department: "Snacks", price: 0.65, quantity: 20},
    B4: %{name: "Daritos", display: "🍿", department: "Snacks", price: 1.0, quantity: 20},
    B5: %{name: "Rold Gold", display: "🍿", department: "Snacks", price: 0.5, quantity: 20},
    B6: %{name: "Fritoos", display: "🍿", department: "Snacks", price: 0.65, quantity: 20},
    B7: %{name: "Ruffles", display: "🍿", department: "Snacks", price: 1.0, quantity: 20},
    B8: %{name: "Bugles", display: "🍿", department: "Snacks", price: 0.5, quantity: 20},
    B9: %{name: "Chesters", display: "🍿", department: "Snacks", price: 0.65, quantity: 20},
    B10: %{name: "Tostitos", display: "🍿", department: "Snacks", price: 1.0, quantity: 20},
    C1: %{name: "Essentia", display: "🌊", department: "Water", price: 1.0, quantity: 20},
    C2: %{name: "Propel", display: "🌊", department: "Water", price: 0.5, quantity: 20},
    C3: %{name: "Aqua Panna", display: "🌊", department: "Water", price: 0.65, quantity: 20},
    C4: %{name: "Uniquely", display: "🌊", department: "Water", price: 1.0, quantity: 20},
    C5: %{name: "Fiji", display: "🌊", department: "Water", price: 0.5, quantity: 20},
    C6: %{name: "Laugh", display: "🌊", department: "Water", price: 0.65, quantity: 20},
    C7: %{name: "Ice Mountain", display: "🌊", department: "Water", price: 1.0, quantity: 20},
    C8: %{name: "Ozarka", display: "🌊", department: "Water", price: 0.5, quantity: 20},
    C9: %{name: "Aquafina", display: "🌊", department: "Water", price: 0.65, quantity: 20},
    C10: %{name: "Crystal Geyser", display: "🌊", department: "Water", price: 1.0, quantity: 20},
    D1: %{name: "Hershey's", display: "🍫", department: "Chocolate", price: 1.0, quantity: 20},
    D2: %{name: "Kisses", display: "🍫", department: "Chocolate", price: 0.5, quantity: 20},
    D3: %{name: "Reese's", display: "🍫", department: "Chocolate", price: 0.65, quantity: 20},
    D4: %{name: "M&M's", display: "🍫", department: "Chocolate", price: 1.0, quantity: 20},
    D5: %{name: "Dove", display: "🍫", department: "Chocolate", price: 0.5, quantity: 20},
    D6: %{name: "Ghirardelli", display: "🍫", department: "Chocolate", price: 0.65, quantity: 20},
    D7: %{name: "KitKat", display: "🍫", department: "Chocolate", price: 1.0, quantity: 20},
    D8: %{name: "Snickers", display: "🍫", department: "Chocolate", price: 0.5, quantity: 20},
    D9: %{
      name: "Ferrero Rocher",
      display: "🍫",
      department: "Chocolate",
      price: 0.65,
      quantity: 20
    },
    D10: %{name: "Lindt", display: "🍫", department: "Chocolate", price: 1.0, quantity: 20},
    E1: %{name: "Bisquick", display: "🍪", department: "Cookies", price: 1.0, quantity: 20},
    E2: %{name: "Red Lobster", display: "🍪", department: "Cookies", price: 0.5, quantity: 20},
    E3: %{name: "Britannia", display: "🍪", department: "Cookies", price: 0.65, quantity: 20},
    E4: %{name: "Glico", display: "🍪", department: "Cookies", price: 1.0, quantity: 20},
    E5: %{name: "Nature Valley", display: "🍪", department: "Cookies", price: 0.5, quantity: 20},
    E6: %{name: "McVitie's", display: "🍪", department: "Cookies", price: 0.65, quantity: 20},
    E7: %{name: "Leibniz", display: "🍪", department: "Cookies", price: 1.0, quantity: 20},
    E8: %{name: "Kedem", display: "🍪", department: "Cookies", price: 0.5, quantity: 20},
    E9: %{name: "Walkers", display: "🍪", department: "Cookies", price: 0.65, quantity: 20},
    E10: %{name: "Biscoff", display: "🍪", department: "Cookies", price: 1.0, quantity: 20},
    F1: %{name: "Planters", display: "🌰", department: "Dry Fruits", price: 1.0, quantity: 20},
    F2: %{name: "Emerald", display: "🌰", department: "Dry Fruits", price: 0.5, quantity: 20},
    F3: %{name: "Medallion", display: "🌰", department: "Dry Fruits", price: 0.65, quantity: 20},
    F4: %{name: "Wonderful", display: "🌰", department: "Dry Fruits", price: 1.0, quantity: 20},
    F5: %{name: "Blue Diamond", display: "🌰", department: "Dry Fruits", price: 0.5, quantity: 20},
    F6: %{name: "Fisher", display: "🌰", department: "Dry Fruits", price: 0.65, quantity: 20},
    F7: %{
      name: "Orchard Valley",
      display: "🌰",
      department: "Dry Fruits",
      price: 1.0,
      quantity: 20
    },
    F8: %{name: "Corn Nuts", display: "🌰", department: "Dry Fruits", price: 0.5, quantity: 20},
    F9: %{name: "GourmetNut", display: "🌰", department: "Dry Fruits", price: 0.65, quantity: 20},
    F10: %{name: "Beer Nuts", display: "🌰", department: "Dry Fruits", price: 1.0, quantity: 20},
    G1: %{name: "Bud Light", display: "🍺", department: "Beer", price: 1.0, quantity: 20},
    G2: %{name: "Corona", display: "🍺", department: "Beer", price: 0.5, quantity: 20},
    G3: %{name: "Heinenken", display: "🍺", department: "Beer", price: 0.65, quantity: 20},
    G4: %{name: "Michelob", display: "🍺", department: "Beer", price: 1.0, quantity: 20},
    G5: %{name: "Coors", display: "🍺", department: "Beer", price: 0.5, quantity: 20},
    G6: %{name: "Modelo", display: "🍺", department: "Beer", price: 0.65, quantity: 20},
    G7: %{name: "Budweiser", display: "🍺", department: "Beer", price: 1.0, quantity: 20},
    G8: %{name: "Blue Moon", display: "🍺", department: "Beer", price: 0.5, quantity: 20},
    G9: %{name: "Busch", display: "🍺", department: "Beer", price: 0.65, quantity: 20},
    G10: %{name: "Pabst", display: "🍺", department: "Beer", price: 1.0, quantity: 20},
    H1: %{name: "Nature Valley", display: "🍠", department: "Bar", price: 1.0, quantity: 20},
    H2: %{name: "Kashi", display: "🍠", department: "Bar", price: 0.5, quantity: 20},
    H3: %{name: "Chewy", display: "🍠", department: "Bar", price: 0.65, quantity: 20},
    H4: %{name: "Kind", display: "🍠", department: "Bar", price: 1.0, quantity: 20},
    H5: %{name: "Larabar", display: "🍠", department: "Bar", price: 0.5, quantity: 20},
    H6: %{name: "Kellogg's", display: "🍠", department: "Bar", price: 0.65, quantity: 20},
    H7: %{name: "Golden Grahams", display: "🍠", department: "Bar", price: 1.0, quantity: 20},
    H8: %{name: "Newtons", display: "🍠", department: "Bar", price: 0.5, quantity: 20},
    H9: %{name: "Fiber One", display: "🍠", department: "Bar", price: 0.65, quantity: 20},
    H10: %{name: "Clif Bar", display: "🍠", department: "Bar", price: 1.0, quantity: 20},
    I1: %{name: "Carnation", display: "🥛", department: "Milk", price: 1.0, quantity: 20},
    I2: %{name: "Lala", display: "🥛", department: "Milk", price: 0.5, quantity: 20},
    I3: %{name: "Choco Milk", display: "🥛", department: "Milk", price: 0.65, quantity: 20},
    I4: %{name: "Atkins", display: "🥛", department: "Milk", price: 1.0, quantity: 20},
    I5: %{name: "Enfagrow", display: "🥛", department: "Milk", price: 0.5, quantity: 20},
    I6: %{name: "Go & Grow", display: "🥛", department: "Milk", price: 0.65, quantity: 20},
    I7: %{name: "Muscle Milk", display: "🥛", department: "Milk", price: 1.0, quantity: 20},
    I8: %{name: "Pure Bliss", display: "🥛", department: "Milk", price: 0.5, quantity: 20},
    I9: %{name: "Mars", display: "🥛", department: "Milk", price: 0.65, quantity: 20},
    I10: %{name: "Vitasoy", display: "🥛", department: "Milk", price: 1.0, quantity: 20},
    J1: %{name: "Starbucks", display: "☕", department: "Coffee", price: 1.0, quantity: 20},
    J2: %{name: "Kitu", display: "☕", department: "Coffee", price: 0.5, quantity: 20},
    J3: %{name: "Califia", display: "☕", department: "Coffee", price: 0.65, quantity: 20},
    J4: %{name: "Rise", display: "☕", department: "Coffee", price: 1.0, quantity: 20},
    J5: %{name: "Bulletproof", display: "☕", department: "Coffee", price: 0.5, quantity: 20},
    J6: %{name: "Dunkin's Donuts", display: "☕", department: "Coffee", price: 0.65, quantity: 20},
    J7: %{name: "McCafe", display: "☕", department: "Coffee", price: 1.0, quantity: 20},
    J8: %{name: "Hills Bros", display: "☕", department: "Coffee", price: 0.5, quantity: 20},
    J9: %{name: "Foro", display: "☕", department: "Coffee", price: 0.65, quantity: 20},
    J10: %{name: "Click", display: "☕", department: "Coffee", price: 1.0, quantity: 20}
  }
  def item, do: @item
end