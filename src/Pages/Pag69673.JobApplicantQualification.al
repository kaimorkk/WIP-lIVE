

page 69673 "Job Applicant Qualification"
{
    PageType = List;
    SourceTable = "Job Applicants Qualification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field("Specialized Domain Area"; Rec."Specialized Domain Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specialized Domain Area field.';
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Date field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                    Visible = false;
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution/Company field.';
                }
                field("Membership Type"; Rec."Membership Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Type field.';
                }
                field("Membership Registration No"; Rec."Membership Registration No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Registration No field.';
                }
                field("Member Renewal Date"; Rec."Member Renewal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Registration No field.';
                }
                field("Licensing Number"; Rec."Licensing Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Registration No field.';
                }
                field("Licensing Renewal Date"; Rec."Licensing Renewal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Membership Registration No field.';
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost field.';
                }
                field("Course Grade"; Rec."Course Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Grade field.';
                }
                field("Job Applicant Status"; Rec."Job Applicant Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Applicant Status field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                    Visible = false;
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiration Date field.';
                }
                field("Job Description/Designation"; Rec."Job Description/Designation")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Duties and Resposibilities"; Rec."Duties and Resposibilities")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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

