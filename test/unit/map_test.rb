require 'test_helper'

class MapTest < ActiveSupport::TestCase

  test "basics" do
    assert_not_nil Map.bbox(0,0,90,180)
    assert_not_nil Map.authors
    assert_not_nil Map.new_maps

    map = Map.first
    assert_not_nil map.license_link
    assert_not_nil map.author
    assert_not_nil map.name
    assert_not_nil map.created_at
    assert_not_nil map.slug
    assert_not_nil map.lat
    assert_not_nil map.lon
    assert_not_nil map.location
    assert_not_nil map.description
    assert_not_nil map.zoom
    assert_not_nil map.license
    assert_not_nil map.exports
    assert_not_nil map.tags
    assert_not_nil map.comments
    assert_not_nil map.user
    assert_not_nil map.private
    assert_not_nil map.anonymous?

    assert_not_nil map.images_histogram
    assert_not_nil map.grouped_images_histogram(10)
    assert_not_nil map.nearby_maps(100) # in degrees lat/lon
  end

  test "export functions" do
    map = Map.first
    assert_not_nil map.average_scale
    assert_not_nil map.placed_warpables
    assert_not_nil map.best_cm_per_pixel
    assert_not_nil map.exporting?
    assert_not_nil map.export
    assert_not_nil map.latest_export
    assert_not_nil map.nodes
    assert_not_nil map.average_cm_per_pixel

    # map.run_export(user,resolution)
    # map.distort_warpables(scale)
    # map.generate_composite_tiff(coords,origin)
    # map.generate_tiles
    # map.zip_tiles
    # map.generate_jpg

  end

  test "tag basics" do
    map = Map.first
    assert !map.has_tag('test')
    assert map.add_tag('test', User.first)
    assert map.has_tag('test')
  end

end
