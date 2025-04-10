

page 59051 "Fund Opportunity Card"
{
    PageType = Card;
    SourceTable = "Funding Oportunity";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
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
                field("Donor Name"; Rec."Donor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Donor Name field.';
                }
                field("Eligibility Criteria"; Rec."Eligibility Criteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Eligibility Criteria field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Date Awarded"; Rec."Date Awarded")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Date Awarded field.';
                }
                field("Total Amount Applied"; Rec."Total Amount Applied")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Amount Applied field.';
                }
                field(Open; Rec.Open)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Open field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

