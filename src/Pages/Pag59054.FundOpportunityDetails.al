

page 59054 "Fund Opportunity Details"
{
    CardPageID = "Fund Opportunity Detail Card";
    Editable = false;
    PageType = List;
    SourceTable = "Funding Oportunity";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Donor Type"; Rec."Donor Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Donor Type field.';
                }
                field("Donor No"; Rec."Donor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Donor No field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Date Awarded"; Rec."Date Awarded")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Awarded field.';
                }
                field("Total Amount Applied"; Rec."Total Amount Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount Applied field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field(Open; Rec.Open)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Open field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Donor Name"; Rec."Donor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Donor Name field.';
                }
                field("Eligibility Criteria"; Rec."Eligibility Criteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Eligibility Criteria field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control18; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control19; Links)
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

