describe('Navigation', () => {
  it('should update the number of items in cart when adding an item to the cart', () => {
    cy.visit('/');
    cy.contains('Add').first().click({force: true});
    cy.contains('My Cart (1)');
  });
})