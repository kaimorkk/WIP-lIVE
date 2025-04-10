

page 70023 "Bidder Mandatory Requirements"
{
    PageType = Card;
    SourceTable = "Bidder Mandatory Requirements";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Complied; Rec.Complied)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complied field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Evaluater User Id"; Rec."Evaluater User Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluater User Id field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

