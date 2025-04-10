

page 69497 "HSE Role"
{
    PageType = Card;
    SourceTable = "HSE Role";

    layout
    {
        area(content)
        {
            group(General)
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
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executive Summary field.';
                }
                field("Directly Reports To"; Rec."Directly Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directly Reports To field.';
                }
                field("Indirectly Reports To"; Rec."Indirectly Reports To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Indirectly Reports To field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control8; "HSE Responsibility Lines")
            {
                Caption = 'Roles & Responsibilities';
                SubPageLink = "Role ID" = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Appointed Members")
            {
                ApplicationArea = Basic;
                Image = MapAccounts;
                RunObject = Page "HSE Role Members";
                RunPageLink = "Role ID" = field(Code);
                ToolTip = 'Executes the Appointed Members action.';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Appointed Members_Promoted"; "Appointed Members")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

