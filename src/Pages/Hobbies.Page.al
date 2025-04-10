

page 52193876 "Hobbies"
{
    PageType = List;
    SourceTable = "Applicant_Employee Hobby";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                }
                field("Hobby Type"; Rec."Hobby Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hobby Type field.';
                }
                field("Hobby Category"; Rec."Hobby Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hobby Category field.';
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
            systempart(Control7; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Links)
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



