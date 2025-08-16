const cds = require("@sap/cds")

module.exports = function() {
	const { Books, Sales } = cds.entities("shopBook")

	// reduce stock of ordered books if available stock suffices
	this.on("submitOrder", "Books", async (req) => {
		const { quantity } = req.data
		const book = req.params[0].ID || req.params[0]
		if (quantity < 1) return req.reject(400, `quantity has to be 1 or more`)
		let b = await SELECT.from(Books, book)
		if (!b) return req.error(404, `Book #${book} doesn't exist`)
		let { stock, price, currency_code } = b
		if (quantity > stock) return req.reject(409, `${quantity} exceeds stock for book #${book}`)
		await UPDATE(Books, book).with({ stock: stock -= quantity })
		await INSERT.into(Sales).entries({
			book_ID: book,
			dateTime: new Date().toISOString(),
			price: price * quantity,
			currency_code: currency_code
		})
		return { stock }
	})

	this.after("each", "Books", async book =>  {	
		if (book.stock >= 20) {
			book.criticality = 3 // Positive
		} else if (book.stock > 0) {
			book.criticality = 2 // Critical
		} else {
			book.criticality = 1 // Negative
		}
	})

	// before handler to ensure aggregations can be calculated on db level
	this.before("READ", "Sales", async () => {
		const sales = await SELECT(Sales)
		for (const s of sales) {
			await UPDATE(Sales, s.ID).with({
				date: s.dateTime.split("T")[0]
			})
		}
	})

}

// const cds = require('@sap/cds')

// module.exports = class CatalogService extends cds.ApplicationService { init() {

//   const { Books, Sales, Authors } = cds.entities('CatalogService')

//   this.before (['CREATE', 'UPDATE'], Books, async (req) => {
//     console.log('Before CREATE/UPDATE Books', req.data)
//   })
//   this.after ('READ', Books, async (books, req) => {
//     console.log('After READ Books', books)
//   })
//   this.before (['CREATE', 'UPDATE'], Sales, async (req) => {
//     console.log('Before CREATE/UPDATE Sales', req.data)
//   })
//   this.after ('READ', Sales, async (sales, req) => {
//     console.log('After READ Sales', sales)
//   })
//   this.before (['CREATE', 'UPDATE'], Authors, async (req) => {
//     console.log('Before CREATE/UPDATE Authors', req.data)
//   })
//   this.after ('READ', Authors, async (authors, req) => {
//     console.log('After READ Authors', authors)
//   })


//   return super.init()
// }}
