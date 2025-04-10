

page 69658 "Commitee Appointment Vouchers"
{
    CardPageID = "Commitee Appointment Voucher";
    Editable = false;
    PageType = List;
    SourceTable = "Commitee Appointment Voucher";
    // SourceTableView = where("Document Type" = filter(Appointment));
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }


                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Appointment Effective Date"; Rec."Appointment Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment Effective Date field.';
                }
                field("Tenure End Date"; Rec."Tenure End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tenure End Date field.';
                }
                field("Appointing Authority"; Rec."Appointing Authority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointing Authority field.';
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field("Staff ID"; Rec."Staff ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Branch/Centre"; Rec."Branch/Centre")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch/Centre field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Required No. of Members"; Rec."Required No. of Members")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimimum Required No. of Members field.';
                }
                field("Appointed Members"; Rec."Appointed Members")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual No. of Appointed Members field.';
                }
                field("Terminated Members"; Rec."Terminated Members")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual No. of Terminated Members field.';
                }

                field("Document Type"; Rec."Document Type")
                {
                    Visible = false;
                }


            }
        }
        area(factboxes)
        {
            systempart(Control26; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; Links)
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

