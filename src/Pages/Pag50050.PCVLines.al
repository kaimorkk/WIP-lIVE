namespace ALProjectLIWPA.ALProjectLIWPA;


page 50050 "PCV Lines"
{
    PageType = ListPart;
    SourceTable = "PV Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Type field.';
                    trigger OnValidate()
                    begin
                        //TESTFIELD(Status,Status::Open);
                    end;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No field.';
                    trigger OnValidate()
                    begin
                        //TESTFIELD(Status,Status::Open);
                    end;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                    trigger OnValidate()
                    begin
                        //TESTFIELD(Status,Status::Open);
                    end;
                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Amount field.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("VAT Rate"; Rec."VAT Rate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the VAT Rate field.';
                }
                field("VAT Six % Rate"; Rec."VAT Six % Rate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the VAT Six % Rate field.';
                    trigger OnValidate()
                    begin
                        //TESTFIELD(Status,Status::Open);
                    end;
                }
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the VAT Withheld Code field.';
                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("VAT Withheld Amount"; Rec."VAT Withheld Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the VAT Withheld Amount field.';
                    trigger OnValidate()
                    begin
                        //TESTFIELD(Status,Status::Open);
                    end;
                }
                field("Budgetary Control A/C"; Rec."Budgetary Control A/C")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Budgetary Control A/C field.';
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Advance Recovery field.';
                    trigger OnValidate()
                    begin
                        //TESTFIELD(Status,Status::Open);
                    end;
                }
                field("Retention  Amount"; Rec."Retention  Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Retention  Amount field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Claim Doc No."; Rec."Claim Doc No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Claim Doc No. field.';
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the VAT Code field.';
                }
                field("W/Tax Code"; Rec."W/Tax Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the W/Tax Code field.';
                    trigger OnValidate()
                    begin
                        //TESTFIELD(Status,Status::Open);
                    end;
                }
                field("W/T VAT Code"; Rec."W/T VAT Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the W/T VAT Code field.';
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the VAT Amount field.';
                }
                field("W/Tax Amount"; Rec."W/Tax Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the W/Tax Amount field.';
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        //TESTFIELD(Status,Status::Open);
                    end;

                    trigger OnValidate()
                    begin
                        //TESTFIELD(Status,Status::Open);
                    end;
                }
                field("Total Net Pay"; Rec."Total Net Pay")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Net Pay field.';
                    trigger OnValidate()
                    begin
                        //TESTFIELD(Status,Status::Open);
                    end;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

