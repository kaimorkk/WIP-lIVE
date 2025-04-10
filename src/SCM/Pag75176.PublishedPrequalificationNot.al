

page 75176 "Published Prequalification Not"
{
    Caption = 'Published Prequalification Notices';
    CardPageID = "IFP Card";
    Editable = false;
    PageType = List;
    SourceTable = "Request For Information";
    SourceTableView = where("Document Type" = const("Invitation For Prequalification"),
                            Published = const(true),
                            Status = const(Released));
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Link to  No Series on the E-Procurement Setup Table (Different No. Series shall be defined for different Request for Information e.g. IFP,EOI';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Summary"; Rec."Tender Summary")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Target Vendor Cluster"; Rec."Primary Target Vendor Cluster")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is used for categorization of the prequalifications since the different supplier clusters may have different sets of unique requirements. NB: We separate Contractors because of the dedicated Contractors Portal used during Project execution';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'For external references such as Memo etc';
                }
                field("Period Start Date"; Rec."Period Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Indicate the Prequalification Start Date (To define period of prequalification of the vendor)';
                }
                field("Period End Date"; Rec."Period End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Indicate the Prequalification End Date (To define period of prequalification of the vendor)';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Tender Box Location Code"; Rec."Tender Box Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Prequalification Charge Code"; Rec."Prequalification Charge Code")
                {
                    ApplicationArea = Basic;
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Start Date"; Rec."Submission Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Start Time"; Rec."Submission Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Date"; Rec."Submission End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Submission End Time"; Rec."Submission End Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Submission"; Rec."No. of Submission")
                {
                    ApplicationArea = Basic;
                }
                field("Enforce Mandatory E-Receipt"; Rec."Enforce Mandatory E-Receipt")
                {
                    ApplicationArea = Basic;
                }
                field("Procurement Document Template"; Rec."Procurement Document Template")
                {
                    ApplicationArea = Basic;
                }
                field("Display Scoring Criteria Vendo"; Rec."Display Scoring Criteria Vendo")
                {
                    ApplicationArea = Basic;
                }
                field("RFI Scoring Template"; Rec."RFI Scoring Template")
                {
                    ApplicationArea = Basic;
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                }
                field("Summarized Terms & Conditions"; Rec."Summarized Terms & Conditions")
                {
                    ApplicationArea = Basic;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 3 Code"; Rec."Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control42; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control43; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control44; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control45; Links)
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

