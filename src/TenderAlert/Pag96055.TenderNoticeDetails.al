page 96055 "Tender Notice Details"
{
    ApplicationArea = All;
    Caption = 'Tender Notice Details';
    PageType = Card;
    SourceTable = "Tender Notices";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(OCID; Rec.OCID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OCID field.', Comment = '%';
                }
                field("Tender No."; Rec."Tender No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender No. field.', Comment = '%';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.', Comment = '%';
                }
                field("Procurement Method"; Rec."Procurement Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Method field.', Comment = '%';
                }
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Category field.', Comment = '%';
                }
                field("Submission Methods"; Rec."Submission Methods")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Methods field.', Comment = '%';
                }
                field("Opening Venue"; Rec."Opening Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Venue field.', Comment = '%';
                }
                field("Published Date"; Rec."Published Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published Date field.', Comment = '%';
                }
                field("Close DateTime"; Rec."Close DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Close DateTime field.', Comment = '%';
                }
                field("Tender Fee"; Rec."Tender Fee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Fee field.', Comment = '%';
                }
                field("Tender Validity in Days"; Rec."Tender Validity in Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Validity in Days field.', Comment = '%';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year field.', Comment = '%';
                }
                field("Preference & Reserve Scheme"; Rec."Preference & Reserve Scheme")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preference & Reserve Scheme field.', Comment = '%';
                }
                field("Public Link"; Rec."Public Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Public Link field.', Comment = '%';
                }
            }
        }
    }
}
