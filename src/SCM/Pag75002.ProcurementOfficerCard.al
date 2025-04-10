

page 75002 "Procurement Officer Card"
{
    Caption = 'Salesperson/Purchaser Card';
    PageType = Card;
    SourceTable = "Salesperson/Purchaser";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a code for the salesperson or purchaser.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the name of the salesperson or purchaser.';
                }

                field("Current Position"; Rec."Current Position")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Current Position field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Editable = false;
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Employee Status"; Rec."Employee Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = RelationshipMgmt;
                    Editable = false;
                    ToolTip = 'Specifies the salesperson''s telephone number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = RelationshipMgmt;
                    Editable = false;
                    ExtendedDatatype = EMail;
                    ToolTip = 'Specifies the salesperson''s email address.';
                }
            }
            group(Invoicing)
            {
                Caption = 'Dimensions';
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    Editable = false;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                        DimsValue: Record "Dimension Value";
                    begin
                        DimsValue.Reset();
                        DimsValue.SetRange(Code, rec."Global Dimension 1 Code");
                        if DimsValue.FindFirst() then begin
                            rec."Geographical Name" := DimsValue.Name;
                        end;

                    end;
                }
                field("Geographical Name"; Rec."Geographical Name")
                {
                    ApplicationArea = all;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    Editable = false;
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                        DimsValue: Record "Dimension Value";
                    begin
                        DimsValue.Reset();
                        DimsValue.SetRange(Code, rec."Global Dimension 2 Code");
                        if DimsValue.FindFirst() then begin
                            rec."Admin Unit Name" := DimsValue.Name;
                        end;

                    end;
                }
                field("Admin Unit Name"; Rec."Admin Unit Name")
                {
                    ApplicationArea = all;
                }
            }
        }
        area(factboxes)
        {
            part(Control3; "Salesperson/Purchaser Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = Code = field(Code);
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Salesperson")
            {
                Caption = '&Salesperson';
                Image = SalesPerson;
                action("Assigned RFIs")
                {
                    ApplicationArea = Basic;
                    Image = Info;
                    RunObject = Page "Request For Information";
                    RunPageLink = "Assigned Procurement Officer" = field(Code);
                }
                action("Assigned Invitation For Supply")
                {
                    ApplicationArea = Basic;
                    Image = InwardEntry;
                    RunObject = Page "Draft Invitation For Supply";
                    RunPageLink = "Assigned Procurement Officer" = field(Code);
                }
                action("Assigned Quotes")
                {
                    ApplicationArea = Basic;
                    Image = Quote;
                    RunObject = Page "Purchase Quotes";
                    RunPageLink = "Purchaser Code" = field(Code);
                }
                action("Assigned Purchase Orders")
                {
                    ApplicationArea = Basic;
                    Image = "Order";
                    RunObject = Page "Purchase Order List";
                    RunPageLink = "Purchaser Code" = field(Code);
                }
                action("Assigned Purchase Agreements")
                {
                    ApplicationArea = Basic;
                    Image = BlanketOrder;
                    RunObject = Page "Blanket Purchase Orders";
                    RunPageLink = "Purchaser Code" = field(Code);
                }
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(13),
                                  "No." = field(Code);
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action(Statistics)
                {
                    ApplicationArea = RelationshipMgmt;
                    Caption = 'Statistics';
                    Image = Statistics;
                    RunObject = Page "Salesperson Statistics";
                    RunPageLink = Code = field(Code);
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Navigate', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("Assigned RFIs_Promoted"; "Assigned RFIs")
                {
                }
                actionref("Assigned Invitation For Supply_Promoted"; "Assigned Invitation For Supply")
                {
                }
                actionref("Assigned Quotes_Promoted"; "Assigned Quotes")
                {
                }
                actionref("Assigned Purchase Orders_Promoted"; "Assigned Purchase Orders")
                {
                }
                actionref("Assigned Purchase Agreements_Promoted"; "Assigned Purchase Agreements")
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Salesperson', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(Statistics_Promoted; Statistics)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
    begin
        if CRMIntegrationEnabled then begin
            CRMIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
            if Rec.Code <> xRec.Code then
                CRMIntegrationManagement.SendResultNotification(Rec);
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if xRec.Code = '' then
            Rec.Reset;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Role Type" := Rec."role type"::"Procurement Officer";
    end;

    trigger OnOpenPage()
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
    end;

    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
}

#pragma implicitwith restore

