module ApplicationHelper
  def supercategories_array
    # ideal supercategories
    # [
    #   {name: "Living room", categories: [
    #     "Media Storage",
    #     "Ottomans",
    #     "Coffee tables",
    #     "End tables/ Nightstands",
    #     "Breakfast trays",
    #     "Snack tables",
    #   ]}, {name: "Entry way", categories: [
    #     "Console tables",
    #     "Benches",
    #     "Coat racks",
    #     "Umbrella stands",
    #   ]}, {name: "Kitchen + Dining", categories: [
    #     "Kitchen islands",
    #     "Kitchen carts",
    #     "Dining sets",
    #     "Tables",
    #     "Bar/pub tables",
    #     "Buffets + Sideboards",
    #     "Chairs",
    #     "Stools",
    #     "Wine storage",
    #   ]}, {name: "Storage + organization", categories: [
    #     "Bookcases",
    #     "Shelves",
    #     "Storage baskets",
    #     "Valet stand",
    #     "Luggage rack",
    #   ]}, {name: "Office", categories: [
    #     "Desks",
    #     "Desk systems",
    #     "Side storage",
    #   ]}
    # ]

    [
      {name: "Living room", categories: [
        "Media Storage",
        "Ottomans",
        "Accent Tables",
        "Breakfast Trays",
        "Nightstands",
        "Occasional Tables",
        "Seating",
      ]}, {name: "Entry way", categories: [
        "Benches",
      ]}, {name: "Kitchen + Dining", categories: [
        "Bar / Pub Table",
        "Buffets + Sideboards",
        "Dining",
        "Kitchen",
        "Kitchen / Serving Carts",
        "Snack Tables",
        "Stools",
      ]}, {name: "Storage + organization", categories: [
        "Baskets",
        "Bookcases + Shelves",
        "Luggage Racks",
        "Cabinets + Cupboards",
        "Storage + Organization",
        "Shelf Storage",
        "Wine Storage",
      ]}, {name: "Office", categories: [
        "Home Office",
      ]}
    ]
  end
end
