TableExtension 52193431 tableextension52193431 extends "G/L Entry"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 7)".


        //Unsupported feature: Property Modification (Data type) on ""Business Unit Code"(Field 45)".


        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 27)".

        field(40034; "Asset No"; Code[20])
        {
        }
        field(50001; "ED Code"; Code[50])
        {
        }
        field(50002; "Commissioner Name"; Text[50])
        {
        }
        field(50003; "Meeting ID"; Code[20])
        {
        }
        field(50004; "Meeting Description"; Text[50])
        {
        }
        field(50005; "Starting Date"; Date)
        {
        }
        field(50006; "Ending Date"; Date)
        {
        }
        field(40035; "Licensee No."; Code[20])
        {
        }
        field(40036; "Payment Type"; Option)
        {
            OptionMembers = " ",Levy,Penalty,Registration;
        }
        field(50031; "Investment Code"; Code[20])
        {
            TableRelation = "Fixed Asset";
        }
        field(50032; "No. Of Units"; Decimal)
        {

            trigger OnValidate()
            begin
                /* IF "Receipt Payment Type"="Receipt Payment Type"::"Unit Trust" THEN BEGIN
                 IF Brokers.GET("Unit Trust Member No") THEN BEGIN
                
                 Brokers.CALCFIELDS("No.Of Units","Acquisition Cost","Current Value",Revaluations);
                 IF "No. Of Units">Brokers."No.Of Units" THEN
                  ERROR('You cannot redeem more units than you have!!');
                
                
                   IF  Brokers."No.Of Units" >0 THEN
                // "Current unit price":=Brokers."Current Value"/Brokers."No.Of Units" ;
                 //"Price Per Share":="Current unit price";
                VALIDATE("Price Per Share");
                VALIDATE(Amount);
                  END;
                
                 END ELSE BEGIN
                  IF "No. Of Units"<0 THEN
                  ERROR('You Cannot Sale Negative No. of Shares!!');
                
                   VALIDATE(Amount);
                 END;*/

            end;
        }
        field(50033; "Investment Transcation Type"; Option)
        {
            OptionCaption = ',Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,Share-split,Premium,Discounts,Other Income,Expenses,Loan Repayment';
            OptionMembers = ,Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,"Loan Repayment",Subsidy;
        }
        field(50036; "AC Type"; Option)
        {
            OptionMembers = "Income Statement","Balance Sheet";
        }
        field(50037; "Gl Type"; Option)
        {
            OptionCaption = ' ,Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,Share-split,Premium,Discounts,Other Income,Expenses,Loan Repayment';
            OptionMembers = " ",Acquisition,Disposal,Interest,Dividend,Bonus,Revaluation,"Share-split",Premium,Discounts,"Other Income",Expenses,"Loan Repayment",Subsidy;
        }
        field(50038; "Employee No."; Code[30])
        {
        }
        field(68000; "Running Balance"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("G/L Account No."),
                                                        "Entry No." = field("Entry No Filter")));
            FieldClass = FlowField;
        }
        field(68001; "Entry No Filter"; Integer)
        {
            FieldClass = FlowFilter;
        }
        field(5700; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center";
        }
        field(50000; "Vendor Name"; Text[50])
        {
            CalcFormula = lookup(Vendor.Name where("No." = field("Source No.")));
            FieldClass = FlowField;
        }
        field(50008; "Broker/Agency Code"; Code[20])
        {
            TableRelation = Vendor;
            DataClassification = CustomerContent;
        }
        field(50009; "Broker/Agency Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50010; "Sales Rep. No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50011; "Sales Rep. Name"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(50012; "First Premium"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50013; "PCF  Levy"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50014; "Training Levy"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50015; "Stamp Duty"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50016; "Yellow Card"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50017; "R/I Code"; Option)
        {
            OptionMembers = "1","2","3","4","5","6";
            DataClassification = CustomerContent;
        }
        field(50018; "Period Start"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50019; "Period End"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50020; "Percentage Of Share"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50021; "Total Renewable Premium"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50022; "Share Of Risk (%)"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50023; "Endorsement No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50024; "Commission Rate"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50025; "Commission Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50026; "Net Premium"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50027; "Business Source"; Option)
        {
            OptionCaption = ' ,Direct,Facultative';
            OptionMembers = " ","1","2";
            DataClassification = CustomerContent;
        }
        field(50028; "Business Line"; Option)
        {
            OptionCaption = ' ,COM,COM-MOU,PLS,PLS-MOU';
            OptionMembers = " ","1","2","3","4";
            DataClassification = CustomerContent;
        }
        field(50029; "Business Class"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(50030; Department; Code[20])
        {
            DataClassification = CustomerContent;
        }



        field(50034; "Original Currency"; Code[20])
        {
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }
        field(50035; "Original Currency Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50039; "Unit Trust Type"; Option)
        {
            OptionCaption = ',Equity,Money Market,Growth';
            OptionMembers = ,Equity,"Money Market",Growth;
            DataClassification = CustomerContent;
        }
        field(50040; "Books Closure Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50041; "Payment Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50042; "Fund Code"; Code[20])
        {
            // TableRelation = "Fund Code".Code;
            DataClassification = CustomerContent;
        }
        field(50043; "Custodian Code"; Code[20])
        {
            // TableRelation = "Custodian Code".Code;
            DataClassification = CustomerContent;
        }
        field(50044; "Cheque No"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(70000; "Procurement Plan"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Header".No;
        }
        field(70001; "Procurement Plan Item"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = "Procurement Plan1"."Plan Item No" where("Plan Year" = field("Procurement Plan"));

            trigger OnValidate()
            begin

                /* ProcurementPlan.RESET;
                ProcurementPlan.SETRANGE(ProcurementPlan."Plan Item No","Procurement Plan Item");
               IF ProcurementPlan.FIND('-') THEN BEGIN
               IF ProcurementPlan."Procurement Type"=ProcurementPlan."Procurement Type"::Goods THEN BEGIN
                 Type:=Type::Item;
                 No:=ProcurementPlan."No.";
               END;
               IF ProcurementPlan."Procurement Type"<>ProcurementPlan."Procurement Type"::Service THEN BEGIN
                Type:=Type::"Non Stock";
                No:=ProcurementPlan."Source of Funds";
               END;
                 "Budget Line":=ProcurementPlan."Source of Funds";
                  Description:=ProcurementPlan."Item Description";
                 "Unit of Measure":=ProcurementPlan."Unit of Measure";
                 "Unit Price":=ProcurementPlan."Unit Price";
               END;
              */

            end;
        }
        field(70002; Name; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70003; "Description 2"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(85000; "Transaction Type"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(85001; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(85002; "Amount Ext"; Decimal)
        {
            Caption = 'Amounts';
            DataClassification = ToBeClassified;
        }
        field(85003; "Global Dimension 1 Code Ext"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(85004; "Global Dimension 2 Code Ext"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(85005; "Shortcut Dimension 3 Code Ext"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(85006; "Shortcut Dimension 4 Code Ext"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(85007; "Shortcut Dimension 5 Code Ext"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(85008; "Shortcut Dimension 6 Code Ext"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(85009; "Shortcut Dimension 7 Code Ext"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(85010; "Shortcut Dimension 8 Code Ext"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(85011; "G/L Account No Ext"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(85012; "PDate Ext"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
}

