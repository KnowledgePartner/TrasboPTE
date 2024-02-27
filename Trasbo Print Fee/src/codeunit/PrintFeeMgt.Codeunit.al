codeunit 55001 "Print Fee Mgt."
{

    procedure HasPrintFeeLine(SalesHeader: Record "Sales Header"; var SalesLine: record "Sales Line"; SalesSetup: Record "Sales & Receivables Setup"): Boolean
    begin

        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetFilter(Type, '%1|%2', SalesLine.Type::" ", SalesLine.Type::"G/L Account");
        SalesLine.SetFilter("No.", '%1|%2', SalesSetup."Print Fee Comment Code", SalesSetup."Print Fee G/L Account");

        if SalesLine.IsEmpty then
            exit(false);

        exit(SalesLine.FindSet());
    end;

    procedure DeletePrintFeeLines(SalesLine: Record "Sales Line")
    begin
        repeat
            SalesLine.Delete(true);
        until salesline.Next() = 0;
    end;

    procedure GetLastLineNo(SalesHeader: Record "Sales Header"): integer
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");

        SalesLine.FindLast();

        exit(SalesLine."Line No.");
    end;

    procedure AddPrintFeeGLLine(SalesHeader: Record "Sales Header"; SalesSetup: Record "Sales & Receivables Setup"; LastLineNo: integer)
    var
        SalesLine: Record "Sales Line";
        NextLineNo: Integer;
    begin
        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine."Document No." := SalesHeader."No.";
        NextLineNo := LastLineNo + 10000;
        SalesLine."Line No." := NextLineNo;
        SalesLine.Type := SalesLine.Type::"G/L Account";
        SalesLine.Validate("No.", SalesSetup."Print Fee G/L Account");
        SalesLine.Insert();
    end;

    procedure AddPrintFeeCommentLine(SalesHeader: Record "Sales Header"; SalesSetup: Record "Sales & Receivables Setup"; LastLineNo: integer) SalesLine: Record "Sales Line";
    var
        NextLineNo: Integer;
    begin
        SalesLine."Document Type" := SalesHeader."Document Type";
        SalesLine."Document No." := SalesHeader."No.";
        NextLineNo := LastLineNo + 10000;
        SalesLine."Line No." := NextLineNo;
        SalesLine.Type := SalesLine.Type::" ";
        SalesLine.Validate("No.", SalesSetup."Print Fee Comment Code");
        SalesLine.Insert();
    end;
}