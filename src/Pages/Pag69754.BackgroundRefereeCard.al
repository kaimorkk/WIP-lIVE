

page 69754 "Background Referee Card"
{
    PageType = Card;
    SourceTable = "Background Checks Reference";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Vacancy Id"; Rec."Vacancy Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy Id field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Referee Id"; Rec."Referee Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referee Id field.';
                }
                field("Referee Type"; Rec."Referee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referee Type field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Title/Designation"; Rec."Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title/Designation field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
                field("Invited for Detailed Recommend"; Rec."Invited for Detailed Recommend")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invited for Detailed Recommend field.';
                }
                field("Invited On"; Rec."Invited On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invited On field.';
                }
                field("Referee Recomm Report ID"; Rec."Referee Recomm Report ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Referee Recomm Report ID field.';
                }
                field("Recommended for Hire"; Rec."Recommended for Hire")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended for Hire field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control19; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; Links)
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

