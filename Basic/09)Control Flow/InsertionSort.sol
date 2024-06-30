// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract InsertionSort {
    // 插入排序 错误版
    function insertionSortWrong(
        uint[] memory a
    ) public pure returns (uint[] memory) {
        for (uint i = 1; i < a.length; i++) {
            uint temp = a[i];
            uint j = i - 1;
            while ((j >= 0) && (temp < a[j])) {
                a[j + 1] = a[j];
                j--;
            }
            a[j + 1] = temp;
        }
        return (a);
    }

    // 插入排序 正确版
    function insertionSort(
        uint[] memory a
    ) public pure returns (uint[] memory) {
        //note that uint can not take negative value
        for (uint i = 1; i < a.length; i++) {
            uint temp = a[i];
            uint j = i;
            while ((j >= 1) && (temp < a[j - 1])) {
                a[j] = a[j - 1];
                j--;
            }
            a[j] = temp;
        }
        return (a);
    }
}

///根據提供的代碼,可以看出兩個 insertionSort 函數的主要區別在於:
// 1. 錯誤版:
// 在 while 迴圈中,它會在 j 等於 0 時,將 a[0] 覆蓋為 a[i]。
// 這可能會導致原始資料數組被意外地修改,從而導致排序錯誤。
// 2. 正確版:
// 在 while 迴圈中,它會在 j 大於等於 1 時進行比較和交換操作。
// 這可確保不會超出數組的索引範圍,從而避免了錯誤版本中的問題。
// 具體來說,正確版本的 insertionSort 函數能夠正確地對輸入數組進行插入排序,而錯誤版本可能會導致數組被意外修改,從而產生排序錯誤。
