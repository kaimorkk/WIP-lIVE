TableExtension 52193538 tableextension52193538 extends "Dimension Value"
{
    fields
    {

        //Unsupported feature: Property Deletion (AccessByPermission) on ""Consolidation Code"(Field 7)".

        field(50000; "AIE Holder"; Code[20])
        {
            Description = 'User ID to define the budget holder';
            TableRelation = User;


        }
        field(50001; "Commissioners Balance"; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = const('302210'),
                                                        "Global Dimension 2 Code" = field(Code)));
            FieldClass = FlowField;
        }
        field(50002; "Commissioners Balance Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "G/L Account";
        }
        field(50003; Email; Text[100])
        {
        }
        field(50021; "Bank Account Number"; Code[100])
        {
        }
        field(50022; "Bank Branch"; Code[100])
        {
            TableRelation = "Employee Bank AccountX1";
        }
        field(50023; "In-Patient Limit"; Decimal)
        {
        }
        field(50024; "Out-Patient Limit"; Decimal)
        {
        }
        field(50025; Directorate; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DIRECTORATE'));
        }
        field(50026; "Directorate Name"; Text[50])
        {
        }
        field(68000; "Account Code"; Code[20])
        {
        }
        field(68001; "Banker Cheque Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(68002; "Clearing Bank Account"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(68003; "No. Series"; Code[20])
        {
        }
        field(68004; "Local Cheque Charges"; Decimal)
        {
        }
        field(68005; "Upcountry Cheque Charges"; Decimal)
        {
        }
        field(68006; "Bounced Cheque Charges"; Decimal)
        {
        }
        field(68007; "G/L Account Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "G/L Account"."No.";
        }
        field(68008; Amount; Decimal)
        {
            CalcFormula = sum("G/L Entry".Amount where("G/L Account No." = field("G/L Account Filter")));
            FieldClass = FlowField;
        }
        field(68009; "Dimension Filter"; Code[20])
        {
        }
        field(68010; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50036; "Totaling Filter"; Text[2048])
        {
            DataClassification = ToBeClassified;
            trigger OnLookup()
            var
                SelectionFilter: Codeunit SelectionFilterManagement;
                DimensionValues: Record "Dimension Value";
                DimensionValuePage: Page "Dimension Values";
            begin
                DimensionValues.Reset();
                DimensionValues.SetRange("Dimension Code", Rec."Dimension Code");
                DimensionValuePage.SetTableView(DimensionValues);
                DimensionValuePage.LookupMode(true);
                if DimensionValuePage.RunModal() = Action::LookupOK then begin
                    DimensionValuePage.SetSelectionFilter(DimensionValues);
                    "Totaling Filter" := SelectionFilter.GetSelectionFilterForDimensionValue(DimensionValues);
                end;
                validate("Totaling Filter");
            end;

            trigger OnValidate()
            begin
                if "Totaling Filter" <> '' then
                    Testfield("Dimension Value Type", "Dimension Value Type"::Total);
            end;
        }
        field(50035; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;
        }

        field(50032; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;

        }
        field(50033; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;
        }
        field(50034; "Apply Unit filter"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50038; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;
        }
        field(50039; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;
        }
        field(50040; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(6),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;
        }
        field(50041; "Shortcut Dimension 7 Code"; Code[20])
        {
            CaptionClass = '1,2,7';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(7),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;
        }
        field(50042; "Shortcut Dimension 8 Code"; Code[20])
        {
            CaptionClass = '1,2,8';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(8),
                                                          Blocked = const(false));
            DataClassification = CustomerContent;
        }
        field(50043; "Has Budget"; Boolean)
        {

            DataClassification = CustomerContent;
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TESTFIELD("Dimension Code");
    TESTFIELD(Code);
    GLSetup.GET;
    "Global Dimension No." := 0;
    IF GLSetup."Global Dimension 1 Code" = "Dimension Code" THEN
    #6..10
      CostAccMgt.UpdateCostCenterFromDim(Rec,Rec,0);
      CostAccMgt.UpdateCostObjectFromDim(Rec,Rec,0);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #3..13
    */
    //end;
    procedure GetDimensionDescription(Number: Integer; Code: Code[20]) Description: Text
    var
        DimensionValue: Record "Dimension Value";
    begin
        DimensionValue.Reset;
        DimensionValue.Setrange("Global Dimension No.", Number);
        DimensionValue.SetRange(Code, Code);
        if DimensionValue.FindFirst() then
            Description := DimensionValue.Name;
    end;

    procedure GetDimensionCaption(Number: Integer): Text
    begin
        case
            Number of
            1:
                exit(FieldCaption("Shortcut Dimension 1 Code").Replace('Code', 'Name'));
            2:
                exit(FieldCaption("Shortcut Dimension 2 Code").Replace('Code', 'Name'));
            3:
                exit(FieldCaption("Shortcut Dimension 3 Code").Replace('Code', 'Name'));
            4:
                exit(FieldCaption("Shortcut Dimension 4 Code").Replace('Code', 'Name'));
            5:
                exit(FieldCaption("Shortcut Dimension 5 Code").Replace('Code', 'Name'));
            6:
                exit(FieldCaption("Shortcut Dimension 6 Code").Replace('Code', 'Name'));
            7:
                exit(FieldCaption("Shortcut Dimension 7 Code").Replace('Code', 'Name'));
            8:
                exit(FieldCaption("Shortcut Dimension 8 Code").Replace('Code', 'Name'));
        end;
    end;

    procedure DrillDownDimensionValue(Number: Integer; DimValueCode: Code[20])
    var
        DimValue: Record "Dimension Value";
        DimValuesList: Page "Dimension Values";
    begin
        DimValue.SetRange("Global Dimension No.", Number);
        DimValue.Setrange(Code, DimValueCode);
        DimValuesList.SetTableView(DimValue);
        DimValuesList.Editable := false;
        DimValuesList.RunModal();
    end;

    procedure GetGrouping(Number: Integer; DimValueCode: Code[20]): Code[20]
    var
        DimValue: Record "Dimension Value";
    begin
        DimValue.SetLoadFields("Global Dimension No.", Code);
        DimValue.SetRange("Global Dimension No.", Number);
        DimValue.SetFilter(Code, '<%1', DimValueCode);
        DimValue.SetRange("Dimension Value Type", DimValue."Dimension Value Type"::Total);
        DimValue.SetFilter("Totaling Filter", '<>%1', '');
        if DimValue.FindLast() then
            exit(DimValue.Code);
    end;

    var
        CheckDimErr: Text[250];
        UsedInPostedEntries: Boolean;
        UsedInBudgetEntries: Boolean;
        LoginMgt: Codeunit "User Management";
}

