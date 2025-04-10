

page 80086 "Goal Templates"
{
    PageType = List;
    SourceTable = "Goal Template";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Global; Rec.Global)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global field.';
                }
                field("Primary Responsibility Center"; Rec."Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Responsibility Center field.';
                }
                field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corporate Strategic Plan ID field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Goal Template Lines")
            {
                ApplicationArea = Basic;
                Caption = 'Goal Template Lines';
                Image = AddAction;
                RunObject = Page "Goal Template Lines";
                RunPageLink = "Goal Template ID" = field(Code);
                ToolTip = 'Executes the Goal Template Lines action.';
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Goal Template Lines_Promoted"; "Goal Template Lines")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

