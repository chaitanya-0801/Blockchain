// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChain {

    enum State {
        Created,
        Shipped,
        Delivered
    }

    struct Product {
        uint id;
        string name;
        string origin;
        uint price;
        address currentOwner;
        State state;
    }

    mapping(uint => Product) public products;

    function createProduct(
        uint _id,
        string memory _name,
        string memory _origin,
        uint _price
    ) public {

        products[_id] = Product(
            _id,
            _name,
            _origin,
            _price,
            msg.sender,
            State.Created
        );
    }

    function shipProduct(uint _id) public {
        products[_id].state = State.Shipped;
    }

    function deliverProduct(uint _id) public {
        products[_id].state = State.Delivered;
    }

    function getProduct(uint _id)
        public
        view
        returns (
            uint,
            string memory,
            string memory,
            uint,
            address,
            State
        )
    {
        Product memory p = products[_id];

        return (
            p.id,
            p.name,
            p.origin,
            p.price,
            p.currentOwner,
            p.state
        );
    }
}