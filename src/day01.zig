const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;

const util = @import("util.zig");
const gpa = util.gpa;

const data: []const u8 = @embedFile("data/day01.txt");

pub fn main() !void {
    var res: u32 = 0;

    var iterator = std.mem.splitScalar(u8, data, '\n');
    while (iterator.next()) |value| {
        if (value.len == 0) continue;

        var firstDigit: ?u8 = null;
        var secondDigit: ?u8 = null;

        for (value) |c| {
            if (!std.ascii.isDigit(c)) {
                continue;
            }

            if (firstDigit == null) {
                firstDigit = c;
            } else {
                secondDigit = c;
            }
        }

        if (firstDigit) |first| {
            const twoDigitNumber = [2]u8{ first, secondDigit orelse first };
            // print("{s}: {s}\n", .{ value, twoDigitNumber });

            const parseResult = try std.fmt.parseUnsigned(u8, &twoDigitNumber, 10);
            res += parseResult;
        }
    }

    print("{d}", .{res});
}

const parseInt = std.fmt.parseInt;
const parseFloat = std.fmt.parseFloat;

const print = std.debug.print;
const assert = std.debug.assert;

const sort = std.sort.block;
const asc = std.sort.asc;
const desc = std.sort.desc;
