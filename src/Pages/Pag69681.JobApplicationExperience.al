

page 69681 "Job Application Experience"
{
    PageType = List;
    SourceTable = "Application Qualification";
    SourceTableView = where("Qualification Category" = filter(Experience));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                    Visible = false;
                }
                field("Job Description/Designation"; Rec."Job Description/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution/Company field.';
                }
                field("Institution/Company"; Rec."Institution/Company")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution/Company field.';
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
                field("Experience Years"; Rec."Experience Years")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Date field.';
                    Visible = false;
                }
                field("Duties and Resposibilities"; Rec."Duties and Resposibilities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duties and Resposibilities field.';
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Qualification Category" := Rec."qualification category"::Experience;
    end;
}

#pragma implicitwith restore

