

page 69496 "HSE Roles"
{
    CardPageID = "HSE Role";
    Editable = false;
    PageType = List;
    SourceTable = "HSE Role";


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
                field("No. Of Default Responsibilteis"; Rec."No. Of Default Responsibilteis")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Default Responsibilteis field.';
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
    }
}

#pragma implicitwith restore

