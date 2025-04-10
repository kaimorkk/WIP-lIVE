page 52193731 "PR Transaction Codes List"
{
    CardPageID = "PR Transaction Code Card";
    PageType = List;
    SourceTable = "PR Transaction Codes";
    Editable = False;
    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Enabled = true;
                field(TransactionCode; "Transaction Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field(TransactionName; "Transaction Name")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field("Non Assignable"; "Non Assignable")
                {
                    ApplicationArea = All;
                }
                field(TransactionType; "Transaction Type")
                {
                    ApplicationArea = All;
                    Enabled = true;
                }
                field(Frequency; Frequency)
                {
                    ApplicationArea = All;
                    Enabled = true;
                }

                field("Transaction Charge Code"; "Transaction Charge Code")
                {
                    ApplicationArea = all;
                }

                field(BalanceType; "Balance Type")
                {
                    ApplicationArea = All;
                    Editable = true;
                    Enabled = true;
                }
                field(Taxable; Taxable)
                {
                    ApplicationArea = All;
                    Editable = true;
                    Enabled = true;
                }

                field(GLAccount; "GL Account")
                {
                    ApplicationArea = All;
                }
                field(GLAccountName; "G/L Account Name")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field("Exempt Housing Levy"; "Exempt Housing Levy")
                {
                    ApplicationArea = All;
                }
                field("Not Included Third"; Rec."Not Included Third")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Not included in a Third Rule field.';
                }

                field("coop parameters"; "coop parameters")
                {
                    ApplicationArea = all;
                }
                field(GroupCode; "Group Code")
                {
                    ApplicationArea = All;
                    TableRelation = "PR Transaction Codes";
                }
                field(GroupDescription; "Group Description")
                {
                    ApplicationArea = All;
                }
                field(Vendor; Rec.Vendor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }
            }
        }
    }

    actions
    {
    }

    var
        myInt: Integer;
}

