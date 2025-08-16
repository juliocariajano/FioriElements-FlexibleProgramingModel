const cds = require('@sap/cds')

const { GET, POST, expect, axios } = cds.test (__dirname+'/..')
axios.defaults.auth = { username: 'alice', password: '' }

describe('OData APIs', () => {

  it('serves CatalogService.Books', async () => {
    const { data } = await GET `/odata/v4/catalog/CatalogService.Books ${{ params: { $select: 'ID,title' } }}`
    expect(data.value).to.containSubset([
      {"ID":15513631,"title":"title-15513631"},
    ])
  })

})
