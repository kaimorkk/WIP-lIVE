

page 75106 "Project Staff Template Exp"
{
    Caption = 'Project Staff Template Experience';
    PageType = List;
    SourceTable = "Project Staff Template Experie";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Key Staff Template ID"; Rec."Key Staff Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Project Role Code"; Rec."Project Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Experience Category"; Rec."Experience Category")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Years of Experience"; Rec."Minimum Years of Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Minimum Experience Req"; Rec."Minimum Experience Req")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

