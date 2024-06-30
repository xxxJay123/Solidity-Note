// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract StructTypes {
    struct Person {
        string name;
        uint age;
        bool isMale;
        string IdCardNumber;
    }

    Person person; // 初始一个person结构体
    // 在 Solidity 中的 struct 概念與 Java 中的 OOP 中的類(class)非常相似。

    //  给结构体赋值 : declare一個全新嘅object
    // 方法1:在函数中创建一个storage的struct引用
    function initPerson1() external {
        Person storage _person1 = person;
        _person1.name = "John";
        _person1.age = 25;
        _person1.isMale = true;
        _person1.IdCardNumber = "123456";
    }

    // 方法2:直接引用状态变量的struct
    function initPerson2() external {
        person.name = "Ken";
        person.age = 30;
        person.isMale = true;
        person.IdCardNumber = "654321";
    }

    // 方法3:构造函数式
    function initPerson3() external {
        person = Person("Tom", 20, false, "789456");
    }

    // 方法4:key value
    function initPerson4() external {
        person = Person({
            name: "Peter",
            age: 25,
            isMale: false,
            IdCardNumber: "1234567890"
        });
    }
}

contract EnumTypes {
    // 将uint 0， 1， 2表示为Buy, Hold, Sell
    enum ActionSet {
        Buy,
        Hold,
        Sell
    }
    // 创建enum变量 action
    ActionSet action = ActionSet.Buy;

    // enum可以和uint显式的转换
    function enumToUint() external view returns (uint) {
        return uint(action);
    }
}
