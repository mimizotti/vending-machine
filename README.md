# Design a vending machine

## User Stories
### User sees a menu
Given I am a user  
When I enter 'Menu' to the vending machine  
Then I should see the following menu returned:  
| CODE | ITEM    | PRICE |
| ---  | ------- | ----- |
| A1   | Cheetos | $1.00 |
| A2   | KitKat  | $1.25 |
| A3   | Water   | $1.00 |
| B1   | Oreos   | $1.50 |
| B2   | Carrots | $0.50 |
| B3   | Sunkist | $1.00 |
| C1   | Lays    | $1.00 |
| C2   | Apple   | $0.75 |
| C3   | Juice   | $1.00 |

### User provides money to vending machine
Given I am a user  
When I provide a certain amount of money to the vending machine  
Then it stores that amount in memory  

### User selects an item less than the amount they provided
Given I am a user  
When I provide 2 quarters  
And I select B1  
And the item price is more than the amount I entered  
Then I see the following message: "Insufficent funds"  

### User selects an item equal to the amount they provided
Given I am a user  
When I provide a dollar and 2 quarters  
And I select B1  
Then I see the following message: "Dispensing Oreos. Change: $0.00"  

### User selects an item more than the amount they provided
Given I am a user  
When I provide 2 dollars  
And I select B1  
Then I see the following message: "Dispensing Oreos. Change: $0.50"  

## Get Involved!

We invite fellow programmers to get involved and contribute to this project by implementing the user stories. Follow these steps to get started:

1. **Clone the Repository**: Start by cloning this repository to your local machine.

    ```
    git clone git@github.com:mimizotti/vending-machine.git
    ```

2. **Explore the User Stories**: Review the user stories outlined in this README to understand the project's requirements and goals.

3. **Write Code**: Start implementing the user stories by writing code and making the desired changes to the project.

4. **Test Your Changes**: Ensure that your code adheres to the user story requirements and test it thoroughly.

5. **Submit a Pull Request**: Once you are satisfied with your changes, submit a pull request to share your work with the project maintainers.

We appreciate your contributions and look forward to collaborating with you on this project! If you have any questions or need assistance, please feel free to reach out.
