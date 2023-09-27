class CreateDatabase < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :itemno
      t.boolean :kit
      t.string :upc
      t.string :collection
      t.string :name
      t.string :description
      t.string :category
      t.string :finish
      t.string :material
      t.boolean :assembly
      t.string :length
      t.string :width
      t.string :height

      t.timestamps
    end

    30.times do
      Item.create(itemno: 94504, kit: true, upc: "021713945044", collection: "Pauline", name: "Pauline 5-PC Set Table With Chairs", description: "", category: "Dining", finish: "Walnut", material: "Solid Wood", assembly: true, length: "0", width: "0", height: "0")
    end
    Item.create(itemno: 10633, kit: false, upc: "021713106339", collection: "Halifax", name: "Halifax Cabinet", description: "", category: "Storage and Organization", finish: "White", material: "Composite Wood", assembly: true, length: "30.71", width: "15.98", height: "26.30")
    Item.create(itemno: 40643, kit: false, upc: "021713406439", collection: "Xola", name: "Xola TV Stand", description: "", category: "Media and Entertainment", finish: "Cappuccino", material: "Solid / Composite Wood", assembly: true, length: "44.02", width: "15.94", height: "24.02")
    Item.create(itemno: 40538, kit: false, upc: "021713405388", collection: "Xola", name: "Xola Coffee Table with 2 Drawers", description: "", category: "Occasional Table", finish: "Cappuccino", material: "Solid / Composite Wood", assembly: true, length: "37", width: "21", height: "18")

    create_table :kits do |t|
      t.integer :kitno
      t.integer :itemno
      t.string :name

      t.timestamps
    end

    Kit.create(kitno: 94504, itemno: 94209, name: "Chairs")
    Kit.create(kitno: 94504, itemno: 94044, name: "Table")

    create_table :retailers do |t|
      t.string :name, null: false
      t.string :image_src, null: false
      t.string :url, null: false

      t.timestamps
    end

    Retailer.create({
      name: "123Stores",
      image_src: "123Stores.gif",
      url: "http://123stores.com/shopby?brand=959",
    })
    Retailer.create({
      name: "AllModern",
      image_src: "allmodern.gif",
      url: "https://www.allmodern.com/Winsome-C534221.html?rtype=9&redir=winsome",
    })
    Retailer.create({
      name: "Amazon",
      image_src: "amazon.gif",
      url:
    "http://www.amazon.com/s/ref=bl_sr_home-garden?ie=UTF8&field-brandtextbin=Winsome+Wood&node=1055398",
    })
    Retailer.create({
      name: "Amazon CA",
      image_src: "amazon--ca.gif",
      url: "https://www.amazon.ca/",
    })
    Retailer.create({
      name: "AMB",
      image_src: "AMB-Furniture.gif",
      url:
    "https://www.ambfurniture.com/",
    })
    Retailer.create({
      name: "Appliances Connection",
      image_src: "appliancesconnection.gif",
      url:
    "https://www.appliancesconnection.com/winsome.html",
    })
    Retailer.create({
      name: "Bed Bath & Beyond",
      image_src: "bedbathandbeyond.gif",
      url: "https://www.bedbathandbeyond.com/store/brand/winsome-trading/1485/1-82?pagSortOpt=DEFAULT-0&view=grid&_requestid=363553",
    })
    Retailer.create({
      name: "Bellacor",
      image_src: "bellacor.gif",
      url: "http://www.bellacor.com/results.cfm?Erp=96&Ns=P_hvhmIndex&Hs=1&Nso=0&Ntt=Winsome",
    })
    Retailer.create({
      name: "Bestbuy CA",
      image_src: "bestbuy_ca.gif",
      url: "https://www.bestbuy.ca/",
    })
    Retailer.create({
      name: "Bison Office",
      image_src: "BisonOffice-LOGO.jpg",
      url: "https://www.bisonoffice.com/brand/3625",
    })
    Retailer.create({
      name: "Christmas Central",
      image_src: "christmas-central.gif",
      url: "https://www.christmascentral.com/",
    })
    Retailer.create({
      name: "Click Here 2 Shop",
      image_src: "Clickhere2shop.gif",
      url: "http://www.clickhere2shop.com/search.php?q=winsome",
    })
    Retailer.create({
      name: "Cymax",
      image_src: "cymax.gif",
      url: "https://www.cymax.com/Winsome--B60.htm",
    })
    Retailer.create({
      name: "Goedekers",
      image_src: "Goedekers.gif",
      url: "https://www.goedekers.com/catalogsearch/result/?q=winsome&form_key=dDizynDmybNAkCNf",
    })
    Retailer.create({
      name: "GWG Outlet",
      image_src: "gwgoutlet.gif",
      url: "https://gwgoutlet.com/",
    })
    Retailer.create({
      name: "Hayneedle",
      image_src: "hayneedle.jpg",
      url: "http://www.hayneedle.com/brands/winsome/list",
    })
    Retailer.create({
      name: "Home Depot",
      image_src: "home-depot.gif",
      url: "https://www.homedepot.com",
    })
    Retailer.create({
      name: "Home Shopping Malls",
      image_src: "Homeshoppingmall.gif",
      url: "https://www.homeshoppingmalls.com/brand/winsome-wood",
    })
    Retailer.create({
      name: "Kart It",
      image_src: "kartit.gif",
      url: "https://kartit.us/",
    })
    Retailer.create({
      name: "Kohls",
      image_src: "Kohls.gif",
      url: "https://www.kohls.com/search.jsp?search=Winsome&submit-search=web-regular",
    })
    Retailer.create({
      name: "Lowes",
      image_src: "lowes-logo.jpg",
      url: "http://www.lowes.ca/winsome-wood_m2278.html",
    })
    Retailer.create({
      name: "Macys",
      image_src: "macys.gif",
      url: "https://www.macys.com/",
    })
    Retailer.create({
      name: "Michael C Fina",
      image_src: "Michaelcfina.gif",
      url: "https://www.michaelcfina.com",
    })
    Retailer.create({
      name: "NFM",
      image_src: "nfm.gif",
      url: "https://www.nfm.com/list.aspx?dsNav=Ntk:primary|Winsome+Trading|3|,Ro:0,Ns:p_is_bestseller|101|-1|&dsDS=D:Winsome+Trading&dsCDS=D:Winsome+Trading&fromsearch=true&q=Winsome+Trading",
    })
    Retailer.create({
      name: "oj commerce",
      image_src: "ojcommerce.gif",
      url: "http://www.ojcommerce.com/search?k=Winsome&brand_id=3101%7C4585&sort=1",
    })
    Retailer.create({
      name: "Open Tip",
      image_src: "opentip.gif",
      url: "https://www.opentip.com/brand/Winsome-7659.html?page=1",
    })
    Retailer.create({
      name: "Organize IT",
      image_src: "organizeit.gif",
      url: "http://search.organizeit.com/search?site=organizesit#?p=Q&lbc=organizesit&uid=391872938&ts=ajax&w=Winsome&isort=score&method=and&view=grid&af=&site=organizesit&filter=type%3aproduct&cnt=300",
    })
    Retailer.create({
      name: "Overstock",
      image_src: "overstock.com.gif",
      url: "https://www.overstock.com/",
    })
    Retailer.create({
      name: "Quill",
      image_src: "quill.gif",
      url:
    "http://www.quill.com/search?x=0&y=0&keywords=Winsome&ajx=1",
    })
    Retailer.create({
      name: "Skyline Decor",
      image_src: "skylinedecor.gif",
      url: "https://skylinedecor.com/",
    })
    Retailer.create({
      name: "Staples",
      image_src: "staples.gif",
      url: "http://www.staples.com/winsome/directory_winsome?fids=&sr=true&sby=6&min=&max=",
    })
    Retailer.create({
      name: "Target",
      image_src: "target.jpg",
      url: "http://www.target.com/",
    })
    Retailer.create({
      name: "The Classy Home",
      image_src: "the-classy-home.gif",
      url: "https://www.theclassyhome.com/",
    })
    Retailer.create({
      name: "Totally Furniture",
      image_src: "Totallyfurniture.gif",
      url: "https://www.totallyfurniture.com/brand/winsome-wood",
    })
    Retailer.create({
      name: "The Shopping Channel",
      image_src: "TSC.png",
      url: "https://www.theshoppingchannel.com/search/Winsome%20furniture?nav=n:0",
    })
    Retailer.create({
      name: "Unbeatable Sale",
      image_src: "Unbeatablesale.jpg",
      url: "http://search1.unbeatablesale.com/?Nty=1&D=Winsome&vno=96&Dk=0&N=0&Ntt=Winsome",
    })
    Retailer.create({
      name: "Vermont Country Store",
      image_src: "Vermontcountrystore.gif",
      url: "https://www.vermontcountrystore.com/home/category/furniture",
    })
    Retailer.create({
      name: "VirVentures",
      image_src: "virventures-logo.gif",
      url: "http://virventures.com/index.php?route=product/search&filter_name=WINS-",
    })
    Retailer.create({
      name: "Walmart",
      image_src: "walmart.gif",
      url: "https://www.walmart.com/search/?facet=brand%3AWinsome&page=1&query=winsome+furniture&sort=rating_high&typeahead=winsome#searchProductResult",
    })
    Retailer.create({
      name: "Walmart CA",
      image_src: "walmart_CA.gif",
      url: "https://www.walmart.ca/brand/winsome/1019740",
    })
    Retailer.create({
      name: "Wayfair",
      image_src: "wayfair.gif",
      url: "http://www.wayfair.com/Winsome-C115456.html",
    })
    Retailer.create({
      name: "Wayfair CA",
      image_src: "Wayfair-CA.gif",
      url: "https://www.wayfair.ca/Winsome-B225.html",
    })

    create_table :categories do |t|
      t.string :name, null: false
      t.string :parent_id

      t.timestamps
    end

    Category.create(name: "Living room", parent_id: nil)
      Category.create(name: "Media Storage ", parent_id: Category.find_by(name: "Living room").id)
      Category.create(name: "Ottomans ", parent_id: Category.find_by(name: "Living room").id)
      Category.create(name: "Coffee tables ", parent_id: Category.find_by(name: "Living room").id)
      Category.create(name: "End tables/ Nightstands", parent_id: Category.find_by(name: "Living room").id)
      Category.create(name: "Breakfast trays", parent_id: Category.find_by(name: "Living room").id)
      Category.create(name: "Snack tables", parent_id: Category.find_by(name: "Living room").id)
    Category.create(name: "Entry way", parent_id: nil)
      Category.create(name: "Console tables", parent_id: Category.find_by(name: "Entry way").id)
      Category.create(name: "Benches", parent_id: Category.find_by(name: "Entry way").id)
      Category.create(name: "Coat racks", parent_id: Category.find_by(name: "Entry way").id)
      Category.create(name: "Umbrella stands", parent_id: Category.find_by(name: "Entry way").id)
    Category.create(name: "Kitchen + Dining", parent_id: nil)
      Category.create(name: "Kitchen islands", parent_id: Category.find_by(name: "Kitchen + Dining").id)
      Category.create(name: "Kitchen carts", parent_id: Category.find_by(name: "Kitchen + Dining").id)
      Category.create(name: "Dining sets ", parent_id: Category.find_by(name: "Kitchen + Dining").id)
      Category.create(name: "Tables ", parent_id: Category.find_by(name: "Kitchen + Dining").id)
      Category.create(name: "Bar/pub tables", parent_id: Category.find_by(name: "Kitchen + Dining").id)
      Category.create(name: "Buffets + Sideboards", parent_id: Category.find_by(name: "Kitchen + Dining").id)
      Category.create(name: "Chairs ", parent_id: Category.find_by(name: "Kitchen + Dining").id)
      Category.create(name: "Stools", parent_id: Category.find_by(name: "Kitchen + Dining").id)
      Category.create(name: "Wine storage ", parent_id: Category.find_by(name: "Kitchen + Dining").id)
    Category.create(name: "Storage + Organization", parent_id: nil)
      Category.create(name: "Bookcases", parent_id: Category.find_by(name: "Storage + Organization").id)
      Category.create(name: "Shelves", parent_id: Category.find_by(name: "Storage + Organization").id)
      Category.create(name: "Storage baskets", parent_id: Category.find_by(name: "Storage + Organization").id)
      Category.create(name: "Valet stand", parent_id: Category.find_by(name: "Storage + Organization").id)
      Category.create(name: "Luggage rack", parent_id: Category.find_by(name: "Storage + Organization").id)
    Category.create(name: "Office", parent_id: nil)
      Category.create(name: "Desks", parent_id: Category.find_by(name: "Office").id)
      Category.create(name: "Desk systems", parent_id: Category.find_by(name: "Office").id)
      Category.create(name: "Side storage", parent_id: Category.find_by(name: "Office").id)
  end
end
