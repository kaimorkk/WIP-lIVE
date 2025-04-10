

page 75217 "Evaluated EOI Invitations"
{
    CardPageID = "EOI Card";
    PageType = List;
    SourceTable = "Request For Information";
    SourceTableView = where("Document Type" = const("EOI Invitation"),
                            "RFI Document Status" = const("Evaluation Stage"));
    UsageCategory = Documents;
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
                    ToolTip = 'This is used for categorization of the prequalifications since the different supplier clusters may have different sets of unique requirements. NB: We separate Contractors because of the dedicated Contractors Portal used during Project execution';
                }
                field("Tender Summary"; Rec."Tender Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Summary field.';
                }
                field("Primary Target Vendor Cluster"; Rec."Primary Target Vendor Cluster")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'This is used for categorization of the prequalifications since the different supplier clusters may have different sets of unique requirements. NB: We separate Contractors because of the dedicated Contractors Portal used during Project execution';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
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
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Tender Box Location Code"; Rec."Tender Box Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Box Location Code field.';
                }
                field("Prequalification Charge Code"; Rec."Prequalification Charge Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prequalification Charge Code field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name 2 field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Created by"; Rec."Created by")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created by field.';
                }
                field("Submission Start Date"; Rec."Submission Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Start Date field.';
                }
                field("Submission Start Time"; Rec."Submission Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Start Time field.';
                }
                field("Submission End Date"; Rec."Submission End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission End Date field.';
                }
                field("Submission End Time"; Rec."Submission End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission End Time field.';
                }
                field("No. of Submission"; Rec."No. of Submission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Submission field.';
                }
                field("Enforce Mandatory E-Receipt"; Rec."Enforce Mandatory E-Receipt")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enforce Mandatory E-Receipt field.';
                }
                field("Procurement Document Template"; Rec."Procurement Document Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Document Template field.';
                }
                field("Display Scoring Criteria Vendo"; Rec."Display Scoring Criteria Vendo")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Display Scoring Criteria Vendo field.';
                }
                field("RFI Scoring Template"; Rec."RFI Scoring Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFI Scoring Template field.';
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date/Time field.';
                }
                field("Summarized Terms & Conditions"; Rec."Summarized Terms & Conditions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Summarized Terms & Conditions field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 3 Code"; Rec."Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 3 Code field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
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

