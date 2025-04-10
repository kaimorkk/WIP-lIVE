// Table 52193461 Collaterals
// {
//     DrillDownPageID = "Loan Guarantors";
//     LookupPageID = "Loan Guarantors";

//     fields
//     {
//         field(1;"Loan No";Code[20])
//         {
//             Editable = false;
//             NotBlank = true;
//             //TableRelation = Loans."Loan No.";
//         }
//         field(2;"Product Code";Code[20])
//         {
//             Editable = false;
//             NotBlank = true;
//             //TableRelation = "Loan Product Types".Code;
//         }
//         field(3;"Code";Code[20])
//         {
//             NotBlank = true;
//         }
//         field(4;Description;Text[30])
//         {
//         }
//         field(5;"Item No/Reg No.";Code[20])
//         {
//         }
//         field(6;Value;Decimal)
//         {
//         }
//         field(7;Attachments;Boolean)
//         {
//         }
//         field(8;Owner;Text[50])
//         {
//         }
//         field(9;"Log Book No.";Code[30])
//         {
//         }
//         field(10;Location;Text[30])
//         {
//         }
//         field(11;"Year of Manufacture";Date)
//         {
//         }
//     }

//     keys
//     {
//         key(Key1;"Loan No","Product Code","Code")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//     }

//     var
//         Cust: Record Customer;
//         LoanGuarantors: Record "Loan Guarantors";
//         LoanApp: Record Loans;
//         TotalGuaranted: Decimal;
//         GeneralSetUp: Record Batches;
//         hesabu: Decimal;
//         LoansG: Integer;
//         LoansR: Record Loans;
//         SelfGuaranteedA: Decimal;
//         GenSetUp: Record "General Set-Up";
//         GuarantShares: Decimal;
//         Text001: label 'This member has commited all his/her shares or has no shares';
//         Text002: label 'Member has guaranteed self Loan therefore can not guarantee another member.';
//         Text003: label 'Member has guaranteed more than %1 active loans. Do you wish to continue?';
//         Text004: label 'Member can not guarantee own loan.';
//         Text005: label 'Member Shares not sufficient to guarantee self.';
//         Text006: label 'This member cannot guarantee more than his/her shares';
//         MonthContrib: Record "Monthly Contributions";
//         BosaProd: Record "Bosa Products";
//         TotalContrib: Decimal;
//         Text007: label 'The Member has no product that can guarantee you';
//         ProdCode: Code[30];
// }

