
module.exports = plugin;

function plugin(builder) {
  builder.append('require("boot");');
  builder.append('require("ga");');
}
