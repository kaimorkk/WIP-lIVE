table 52193660 "PR Vital Setup Info"
{
    LookupPageId = "PR Rates & Ceilings";
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Setup Code"; Code[10])
        {
        }

        field(370; "Implement NHIF Relief"; boolean)
        { }

        field(371; "NHIF Relief Percentage"; Decimal)
        {

        }
        field(372; "NSSF Rate"; Decimal)
        {

        }
        field(373; "NSSF Lower Earning Limit(LEL)"; Decimal)
        {

        }
        field(374; "NSSF Upper Earning Limit(UEL)"; Decimal)
        {

        }
        field(375; "Implement New NSSF"; Boolean)
        {

        }


        field(2; "Tax Relief"; Decimal)
        {
        }
        field(3; "Insurance Relief"; Decimal)
        {
        }
        field(4; "Max Relief"; Decimal)
        {
        }

        field(5; "Mortgage Relief"; Decimal)
        {
        }
        field(6; "Max Pension Contribution"; Decimal)
        {
        }
        field(7; "Tax On Excess Pension"; Decimal)
        {
        }
        field(8; "Loan Market Rate"; Decimal)
        {
        }
        field(9; "Loan Corporate Rate"; Decimal)
        {
        }
        field(10; "Taxable Pay (Normal)"; Decimal)
        {
        }
        field(11; "Taxable Pay (Agricultural)"; Decimal)
        {
        }
        field(12; "NHIF Based on"; Option)
        {
            OptionMembers = Gross,Basic,"Taxable Pay";
        }
        field(13; "NSSF Employee"; Decimal)
        {
        }
        field(14; "NSSF Employer Factor"; Decimal)
        {
        }
        field(15; "OOI Deduction"; Decimal)
        {
        }
        field(16; "OOI December"; Decimal)
        {
        }
        field(17; "Security Day (U)"; Decimal)
        {
        }
        field(18; "Security Night (U)"; Decimal)
        {
        }
        field(19; "Ayah (U)"; Decimal)
        {
        }
        field(20; "Gardener (U)"; Decimal)
        {
        }
        field(21; "Security Day (R)"; Decimal)
        {
        }
        field(22; "Security Night (R)"; Decimal)
        {
        }
        field(23; "Ayah (R)"; Decimal)
        {
        }
        field(24; "Gardener (R)"; Decimal)
        {
        }
        field(25; "Benefit Threshold"; Decimal)
        {
        }
        field(26; "NSSF Based on"; Option)
        {
            OptionMembers = Gross,Basic,"Taxable Pay";
        }
        field(27; "Value Posting"; Decimal)
        {
        }
        field(28; "Disbled Tax Limit"; Decimal)
        {
        }
        field(29; "Minimum Relief Amount"; Decimal)
        {
        }
        field(30; "Secondary Tax Percentage"; Decimal)
        {
        }
        field(31; "Mortgage Relief Percentage"; Decimal)
        {
        }
        field(32; "Payslip Message"; Text[50])
        {
        }
        field(33; "PWD Staff Retirement Age"; Decimal)
        {
        }
        field(34; "Other Staff Retirement Age"; Decimal)
        {
        }
        field(35; "Minimum Taxable Pay"; Decimal)
        {
        }

        field(36; "Enable Payroll Proration"; Boolean)
        {
        }
        field(37; "Enable Relief On PAYE Only"; Boolean)
        {
        }
        field(50100; "PrPension Employer Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
        }
        field(50101; "PrPension Employee Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
        }
        field(50102; "Housing Employee Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
        }
        field(50105; "Implement Housing Levy"; Boolean)
        {
        }
        field(50103; "Housing Levy"; Code[20])
        {
            TableRelation = "PR Transaction Codes" where("Transaction Type" = const(Deduction));
        }
        field(50107; "Bank File Path"; text[200])
        {
        }
        field(50108; "Hardship Allowance Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
        }
        field(50109; "Baggage Allowance Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
        }
        field(50110; "Transfer Allowance Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
        }
        field(50111; "Baggage Allowance Distance"; Decimal)
        {
            Caption = 'Baggage Allowance Distance(KMs)';
        }
        field(50112; "Encrypt Payroll Document"; Decimal)
        {
        }
        field(50113; "Salary Advance Code"; Code[20])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Income));
        }
        field(50114; "Salary Advance Recovery"; Code[20])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Deduction));

        }
        field(50115; "Local Training Levy"; Code[20])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Deduction));

        }
        field(50116; "Int. Training Levy"; Code[20])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Deduction));

        }
        field(50117; "Seconded Emp PAYE"; Decimal)
        {
            Caption = 'Seconded employees paye rate';
        }
        field(50118; "Casual Rates Resource"; Code[20])
        {
            TableRelation = Resource."No.";
        }
        field(50119; "TopUp Allowance"; Code[20])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Income));
        }
        field(50120; NITA; Code[20])
        {
            ValidateTableRelation = false;
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Type" = const(Deduction));
        }
        field(50121; "Salary Arrears Code"; Code[20])
        {
            ValidateTableRelation = false;
            TableRelation = "PR Transaction Codes"."Transaction Code"; //where("Transaction Type" = const(Income))
        }
        field(50122; "Pension Arrears Employee Code"; Code[20])
        {
            ValidateTableRelation = false;
            TableRelation = "PR Transaction Codes"."Transaction Code"; //where("Transaction Type" = const(Income));
        }
        field(50123; "Pension Arrears Employee"; Decimal)
        {
            Caption = 'Pension Arrears Employee %';

        }
        field(50124; "Pension Arrear Employer"; Decimal)
        {
            Caption = 'Pension Arrears Employer %';

        }
        field(50125; "Pension Arrears Employer Code"; Code[20])
        {
            ValidateTableRelation = false;
            TableRelation = "PR Transaction Codes"."Transaction Code"; //where("Transaction Type" = const(Income));
        }
        field(50126; "Exclude A Third"; Boolean)
        {

        }
        field(50127; "Payroll PVS Default Dim 1"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50128; "Payroll PVS Default Dim 2"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50129; "Payroll PVS Default Dim 3"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(50130; "Payroll PVS Default Dim 4"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(50131; "Payroll PVS Default Dim 5"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
        }
        field(50132; "Payroll PVS Default Dim 6"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6));
        }
        field(50133; "Payroll PVS Default Dim 7"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7));
        }
        field(50135; "Post-Retirement Medical"; Code[20])
        {
            ValidateTableRelation = false;
            TableRelation = "PR Transaction Codes"."Transaction Code"; //where("Transaction Type" = const(Income));
        }
        field(50136; "SHIF Percentage"; Decimal)
        {

        }

    }

    keys
    {
        key(Key1; "Setup Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

