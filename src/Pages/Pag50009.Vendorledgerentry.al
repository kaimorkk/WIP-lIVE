namespace ALProjectLIWPA.ALProjectLIWPA;

page 50009 "Director Ledger Entries"
{
    PageType = List;
    SourceTable = "Director Ledger Entry";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Director No"; Rec."Director No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Director No field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Date of Meeting"; Rec."Date of Meeting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Meeting field.';
                }
                field("No of Days"; Rec."No of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Days field.';
                }
                field("Taxable amount"; Rec."Taxable amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable amount field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000028; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000029; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000030; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000031; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

